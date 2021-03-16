---
title: 53 Java libraries to solve your problems
author: Emmanuel Bernard
tags: [ "java" ]
header:
  teaser: /images/blog/java-duke.png
---
Max Andersen asked something interesting over the week-end [on Twitter](https://twitter.com/maxandersen/status/1370808620162682881).

> What is an example of a java library that solved your problem just nicely ? Can be anything as long as available as a jar somewhere :)  

Lo and behold! He received a lot of propositions.
Some by very interested parties (aka ads) but hey, I left them in, I did no editorial selection.
This is an interesting list of libraries to review a few at a time and might give you ideas.

I only added minor personal comments here and there but often _only quoted the tagline of each project in italic_.

![](/images/blog/java-duke.png)

## Language

[Roaster](https://github.com/forge/roaster): _A Java Parser library that allows easy parsing and formatting of Java source files._
_Roaster introduces a fluent interface to manipulate Java source files, like adding fields, methods, annotations and so on._

[JavaPoet](https://github.com/square/javapoet): _: A Java API for generating .java source files._

[Failsafe](https://jodah.net/failsafe/): _Fault tolerance and resilience patterns for the JVM_.
_Failsafe is a lightweight, zero-dependency library for handling failures in Java 8+. It has a concise API for handling everyday use cases and the flexibility to handle everything else. Failsafe works by wrapping executable logic with one or more resilience  policies, which can be combined and  composed  as needed._

[JCTools](http://jctools.github.io/JCTools/): _Java Concurrency Tools for the JVM. This project aims to offer some concurrent data structures currently missing from the JDK._

[Project Lombok](https://projectlombok.org/): _Project Lombok is a java library that automatically plugs into your editor and build tools, spicing up your java._
_Never write another getter or equals method again, with one annotation your class has a fully featured builder, Automate your logging variables, and much more._

[Guava](https://guava.dev/): _Guava is a set of core Java libraries from Google that includes new collection types (such as multimap and multiset), immutable collections, a graph library, and utilities for concurrency, I/O, hashing, caching, primitives, strings, and more! It is widely used on most Java projects within Google, and widely used by many other companies as well._

[RoaringBitmap](https://github.com/RoaringBitmap/RoaringBitmap): _A better compressed bitset in Java_.

[JavaFX](https://openjfx.io/): _JavaFX is an open source, next generation client application platform for desktop, mobile and embedded systems built on Java._

[Vavr](https://www.vavr.io/): _Vavr *core* is a functional library for Java. It helps to reduce the amount of code and to increase the robustness. A first step towards functional programming is to start thinking in immutable values. Vavr provides immutable collections and the necessary functions and control structures to operate on these values. The results are beautiful and just work._

## Base libraries

OCPsoft’s [PrettyTime](https://www.ocpsoft.org/prettytime/) from JBoss alumni Lincoln Baxter: _Convert Java/Android `Date()` objects in just “a few minutes!”_
_PrettyTime is an OpenSource time formatting library. Completely customizable, it creates human readable, relative timestamps like those seen on Digg, Twitter, and Facebook. Get started “right now!” and in over 41 languages !_

[Apache Commons](https://commons.apache.org/): a oldie but a goodie. _Commons Proper is dedicated to one principal goal: creating and maintaining reusable Java components. The Commons Proper is a place for collaboration and sharing, where developers from throughout the Apache community can work together on projects to be shared by the Apache projects and Apache users._
A random selection here

* [Codec](https://commons.apache.org/proper/commons-codec/): code/decode things like Base64, Hex, Phonetic and URLs
* [Collections](https://commons.apache.org/proper/commons-collections/): still useful even though Guava has a more modern approach
* [Logging](https://commons.apache.org/proper/commons-logging/): everyone has a hate love relationship with logging

Generally the Apache Commons are showing their age design wise and more modern libraries are often available.

[Lightbend config](https://github.com/lightbend/config): _configuration library for JVM languages using HOCON files_

[protonpack](https://github.com/poetix/protonpack): _Stream utilities for Java 8_

[Scientist4J](https://github.com/rawls238/Scientist4J): _A port of Github’s Refactoring tool Scientist in Java_

## Server
[fluent-http](https://github.com/CodeStory/fluent-http): *This is the simplest fastest full fledged web server we could come up with.*

[DeltaSpike](http://deltaspike.apache.org/): _DeltaSpike consists of a number of portable CDI extensions that provide useful features for Java application developers._
A nice addition for anyone working on CDI based servers.

[Apache Kafka Streams](https://kafka.apache.org/documentation/streams/): _Kafka Streams is a client library for building applications and microservices, where the input and output data are stored in Kafka clusters. It combines the simplicity of writing and deploying standard Java and Scala applications on the client side with the benefits of Kafka’s server-side cluster technology._

[Project reactor](https://projectreactor.io/): _create efficient reactive systems_

[Apache Camel](https://camel.apache.org/): _Camel is an Open Source integration framework that empowers you to quickly and easily integrate various systems consuming or producing data._

[Netty](https://netty.io/): _Netty is an asynchronous event-driven network application framework for rapid development of maintainable high performance protocol servers & clients._

## Web
[jsoup](https://jsoup.org/): _Java HTML Parser, with the best of HTML5 DOM methods and CSS selectors._

[OkHttp](https://square.github.io/okhttp/): _OkHttp is an HTTP client that’s efficient by default_.

[Retrofit](https://square.github.io/retrofit/): _A type-safe HTTP client for Android and Java_.

[Apache Struts](https://struts.apache.org/): really?? Well yes it had a release in Secember 2020.

[logbook](https://github.com/zalando/logbook): _An extensible Java library for HTTP request and response logging_

[OmniFaces](https://omnifaces.org/): _To make JSF life easier_.

## Parsers and data
[Apache POI](https://poi.apache.org/): _the Java API for Microsoft Documents_.

[tabula-java](https://github.com/tabulapdf/tabula-java): _library for extracting tables from PDF file_

[traprange](https://github.com/thoqbk/traprange): _A Method to Extract Tabular Content from PDF Files_

[specification-arg-resolver](https://github.com/tkaczmarzyk/specification-arg-resolver): _An alternative API for filtering data with Spring MVC & Spring Data JPA_

[GraphQL Java](https://www.graphql-java.com): _GraphQL support for Java_

[MapStruct](https://mapstruct.org/): _Java bean mappings, the easy way!_ from Red Hatter Gunnar Morling and team.

[jOOQ](https://www.jooq.org/): _The easiest way to write SQL in Java_

[caffeine](https://github.com/ben-manes/caffeine): _A high performance caching library for Java_.
Cool core cache library used by many caching frameworks.

[Karate](https://github.com/intuit/karate): _Karate is the only open-source tool to combine API test-automation, mocks,  performance-testing and even UI automation into a single, unified framework. The BDD syntax popularized by Cucumber is language-neutral, and easy for even non-programmers. Assertions and HTML reports are built-in, and you can run tests in parallel for speed._

## Test

[Testcontainers](https://www.testcontainers.org/) _is a Java library that supports JUnit tests, providing lightweight, throwaway instances of common databases, Selenium web browsers, or anything else that can run in a Docker container._  
Nice tool to unit test with external resource dependencies.

[FakeSMTP](http://nilhcem.com/FakeSMTP/): _Dummy SMTP server for developers_.
No update but nice to test SMTP interaction with your components.

[PIT Mutation Testing](http://pitest.org/): _PIT is a state of the art mutation testing system, providing gold standard test coverage for Java and the jvm. It’s fast, scalable and integrates with modern test and build tooling._

[Mockito framework](https://site.mockito.org/): _Tasty mocking framework for unit tests in Java_

[WireMock](http://wiremock.org/): _WireMock is a simulator for HTTP-based APIs. Some might consider it a service virtualization tool or a mock server._

[Awaitility](https://github.com/awaitility/awaitility): _Awaitility is a small Java DSL for synchronizing asynchronous operations_

[XMLUnit](https://www.xmlunit.org/): _Unit Testing XML for Java and .NET_, useful if you’re still doing XML 😂

[EqualsVerifier](https://jqno.nl/equalsverifier/): _EqualsVerifier can be used in Java unit tests to verify whether the contract for the equals and hashCode methods is met._

[AssertJ](https://assertj.github.io/doc/):  _fluent assertions java library_

[springfox](https://github.com/springfox/springfox): _Automated JSON API documentation for API’s built with Spring_

## Tools
[Jmxterm](https://docs.cyclopsgroup.org/jmxterm): _Jmxterm is an open source command line based interactive JMX client written in Java._

[docker-java](https://github.com/docker-java/docker-java): _Java Docker API Client_

[picocli](https://picocli.info/): _a mighty tiny command line interface_

[jqwik](https://jqwik.net/): _Property-Based Testing in Java_

## Others
[Jenetics](https://jenetics.io/): _Java Genetic Algorithm Library.
Jenetics is a Genetic Algorithm, Evolutionary Algorithm, Genetic Programming, and Multi-objective Optimization library, written in modern-day Java.  
If you need this class of algorithm,_ I guess this gets you covered.

[H2 Database Engine](http://h2database.com/html/main.html): _in memory and file based RDBMS_.
H2, an in-memory, embedded RDBMS that has turned highly standards compliant and feature rich, perfect for a lot of vendor agnostic testing.

[pac4j](http://www.pac4j.org/): _security for Java_

[Apache Shiro](https://shiro.apache.org/): _Simple. Java. Security. Powerful and easy-to-use Java security framework that performs authentication, authorization, cryptography, and session management. With Shiro’s easy-to-understand API, you can quickly and easily secure any application – from the smallest mobile applications to the largest web and enterprise applications._
