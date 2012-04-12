---
title: 'What design philosophy for your projects?'
author: 'Emmanuel Bernard'
layout: blog-post
tags: [ jboss, oss ]
---
We had a hotted debate recently in the Hibernate Validator team on a given feature.
As a result, we started to write down our design philosophy for the library.
This is still a work in progress but here it is ([original here][design]):
  
The goal of these projects is to improve developer productivity and ease of use.
  
When adding a feature, we ask this pool of questions:

> 1. Does it feel like the right way of doing things?  
>    If it is not we tend to wait till the idea matures
> 2. Can it be done with an existing construct with similar or less complexity?  
>    Several ways of doing things is counter productive
> 3. Is this feature wrong?  
>    Does it encourage bad practice for example?
> 4. Is this a popular request?
> 5. Is this feature useful?  
>    That is the reason for asking "What's your use case?"
> 6. Is it the most readable approach?
> 7. Is the feature designed consistently with the rest of the library?
>  
> None of these questions should slow down innovation but we want high quality libraries. Keeping them both useful and simple is a 
> constant battle against the easier way of adding features ad nauseum. The team believes it is his responsibility to be the 
> guardian of these principles. We are here to make the world a better place, not give food to guideline writers.

What do you think? And what are your design philosophies?

[design]: https://community.jboss.org/wiki/DesignPhilosophyOfTheHibernateProjects