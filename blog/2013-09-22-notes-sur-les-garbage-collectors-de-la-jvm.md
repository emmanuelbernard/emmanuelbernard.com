---
title: Notes sur les garbage collectors de la JVM
author: Emmanuel Bernard
layout: blog-post
tags: [java, francais]
---
Lors d'une [discussion](https://groups.google.com/forum/#!topic/lescastcodeurs/oHGqTorRies)
sur les différents garbage collectors disponibles sur la JVM,
Rémi Forax est sorti de sa tanière et nous a fait un résumé que je trouve intéressant.

Un peu de contexte, on parlait des différents garbages collectors:

* CMS (Concurrent Mark Sweep): implémentation "classique" dans la JVM HotSpot
* G1: nouvelle implémentation dans la JVM HotSpot qui doit remplacer à terme CMS
* C4: Azul's "pauseless" garbage collector

On parlait notamment de l'impact du temps pendant lequel
les garbages collectors arrêtent le monde (stop the world).

Je laisse Rémi parler (édition mineure de ses propos et emphases personnelle):

> Un GC ça marche en deux grosses phases, le **marquage et la réclamation de la mémoire** des objets non marqués.
> Pour qu'un GC soit rapide et efficace il faut essayer de faire les deux phases en même temps que
> le programme Java tourne. Autant pour le marquage on peut faire les choses pendant
> que le programme tourne autant pour la partie collection c'est plus délicat.
> 
> Il y a deux principaux algorithmes de collection,
> 
> * le **sweep** où on alloue et désalloue comme malloc et free,
>   dans ce cas les objets **ne bougent pas en mémoire** et on peut se retrouver avec du gruyère en mémoire
> * ou le **compact** qui consiste à **recopier les objets vivants** (les marqués) vers une autre zone.
> 
> L'algo de compact est meilleur mais:
> 
> * pour bien marcher il faudrait **2 fois plus de mémoire** que nécessaire,
>   comme cela on a toujours la place de copier les objets d'un endroit à un autre.
> * comme on bouge les objets en mémoire, **le programme Java ne peut pas tourner
>   en même temps car il faut mettre à jour toutes les références** de tous les objets entre
>   leur ancienne adresse et leur nouvelle adresse.
> 
> De plus, réclamer la mémoire de tous le tas est lent si il est gros, donc on **découpe le tas en zone**,
> et on essaye de faire l'algo de GC sur peu de zones à la fois. Pour cela, il faut que
> l'on sache si une zone possède des pointeurs vers les autres zones (et à peu près où sont situés les référence).
> Dans ce cas le GC est incrémental et on utilise le mécanisme de protection de page pour tracker
> les références inter-zones.
> 
> ### CMS
> 
> Pour CMS, le tas est composé de **plusieurs zones ordonnées**,
> on fait des compacts pour passer les objets d'une zone à une autre et la dernière zone (assez grosse)
> ne fait pas de compact mais un sweep.  
> Cette organisation permet de faire un **tracking des objets inter-zone plus simple**, on regarde uniquement
> les pointeurs entre les zones les plus grandes vers les zones les plus petites donc on a pas besoin de coder
> vers quelle zone pointent les références.
> 
> ### G1
> 
> Pour G1, on **track les références inter-zones complets**, donc toutes les zones font des compacts mais
> le mécanisme de tracking est plus compliqué. L'idée de G1 est que l'on indique le temps de collection
> maximum et qu'il adapte le nombre de zone qu'il faudra collecter en fonction. Donc **on a des pause,
> mais si tous ce passe bien, leur durée est bornée**.
> 
> ### C4
> 
> Pour C4, l'idée est de faire la **phase de collection de façon lazy**, comme un compact normal, on
> bouge les objets en mémoire mais on ne ré-écrit pas les adresses, **les références restent avec l'ancienne
> adresse** mais on protège les pages contenant les anciens objet. Comme cela lorsque le programme
> cherche à accéder à un objet, si il possède une référence sur l'ancienne adresse, le mécanisme de
> protection mémoire **émet un page fault**. Et là il y a une astuce, lors d'un page fault, on sait
> à quelle adresse on a voulu lire et aussi quel instruction a merdé. Donc si lors de la génération du
> code assembleur on est capable pour chaque instruction qui peut générer un page fault de dire
> de quel champ de quel objet il s'agit, on peut **mettre à jour la référence dans l'objet donc
> on aura pas de page fault au prochain accès** de ce champ car la référence stockée dans le champ
> sera mise à jour.
> 
> Comme on utilise le **mécanisme de protection mémoire de façon importante**, l'implantation
> **Linux de base n'est pas assez efficace**, donc il faut patcher ton Linux. Le patch n'est pas petit
> car pour que ça dépote, la **structure de données derrière est très spécifique et assez grosse**
> ce qui fait que le patch a peut de chance d'intégrer un jour le trunk de linux.
> 
> Donc **on a pas de pause comme pour CMS ou G1**. En fait, il reste quelques pauses
> car il faut quand même faire un peu de synchro entre les différentes phases de l'algo de GC,
> mais lors de l'exécution du code **on paye le surcout de mise à jour des références au fur et à mesure**.
> De plus, il faut garder pas mal d'information et au niveau du code généré et au niveau de chaque zone
> pour être capable de faire l'association entre l'ancienne adresse et la nouvelle.
> Donc on a pas de pause, mais on a un **overhead plus important qu'avec CMS ou G1**
> (G1 a déjà un overhead plus important que CMS à cause du tracking des références inter-zones).
> 
> ### Conclusion
> 
> En conclusion, pas de solution miracle, le GC à un overhead la question est
> quand veut-on le payer.
