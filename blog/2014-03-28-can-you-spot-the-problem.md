---
title: Can you spot the problem?
author: Emmanuel Bernard
layout: blog-post
tags: [Mac OS X, tool]
---
I am working on Hibernate Search's ability to provide
[field bridge autodiscovery](https://hibernate.atlassian.net/browse/HSEARCH-1552).
I am usually pretty OK at getting a green bar on first run but I got out of luck today.

Can you spot the problem?

     org.hibernate.HibernateException: Error while indexing in Hibernate Search (before transaction completion)
         at org.hibernate.search.backend.impl.EventSourceTransactionContext$DelegateToSynchronizationOnBeforeTx.doBeforeTransactionCompletion(EventSourceTransactionContext.java:194)
         at org.hibernate.engine.spi.ActionQueue$BeforeTransactionCompletionProcessQueue.beforeTransactionCompletion(ActionQueue.java:707)
         at org.hibernate.engine.spi.ActionQueue.beforeTransactionCompletion(ActionQueue.java:387)
         at org.hibernate.internal.SessionImpl.beforeTransactionCompletion(SessionImpl.java:516)
         at org.hibernate.engine.transaction.internal.jdbc.JdbcTransaction.beforeTransactionCommit(JdbcTransaction.java:105)
         at org.hibernate.engine.transaction.spi.AbstractTransactionImpl.commit(AbstractTransactionImpl.java:177)
         at org.hibernate.search.test.bridge.ArrayBridgeTest.prepareData(ArrayBridgeTest.java:95)
         at org.hibernate.search.test.bridge.ArrayBridgeTest.setUp(ArrayBridgeTest.java:58)
         at org.hibernate.search.test.SearchTestCase.runBare(SearchTestCase.java:191)
         at org.junit.internal.runners.JUnit38ClassRunner.run(JUnit38ClassRunner.java:84)
         at org.junit.runner.JUnitCore.run(JUnitCore.java:160)
         at com.intellij.rt.execution.junit.JUnitStarter.main(JUnitStarter.java:67)
     Caused by: org.hibernate.search.bridge.BridgeException: Exception while calling bridge#set
         class: org.hibernate.search.test.bridge.ArrayBridgeTestEntity
         path: dates
         at org.hibernate.search.bridge.util.impl.ContextualExceptionBridgeHelper.buildBridgeException(ContextualExceptionBridgeHelper.java:101)
         at org.hibernate.search.bridge.util.impl.ContextualExceptionBridgeHelper$OneWayConversionContextImpl.set(ContextualExceptionBridgeHelper.java:130)
         at org.hibernate.search.engine.spi.DocumentBuilderIndexedEntity.buildDocumentFields(DocumentBuilderIndexedEntity.java:449)
         at org.hibernate.search.engine.spi.DocumentBuilderIndexedEntity.getDocument(DocumentBuilderIndexedEntity.java:376)
         at org.hibernate.search.engine.spi.DocumentBuilderIndexedEntity.createAddWork(DocumentBuilderIndexedEntity.java:292)
         at org.hibernate.search.engine.spi.DocumentBuilderIndexedEntity.addWorkToQueue(DocumentBuilderIndexedEntity.java:235)
         at org.hibernate.search.engine.impl.WorkPlan$PerEntityWork.enqueueLuceneWork(WorkPlan.java:506)
         at org.hibernate.search.engine.impl.WorkPlan$PerClassWork.enqueueLuceneWork(WorkPlan.java:279)
         at org.hibernate.search.engine.impl.WorkPlan.getPlannedLuceneWork(WorkPlan.java:165)
         at org.hibernate.search.backend.impl.WorkQueue.prepareWorkPlan(WorkQueue.java:131)
         at org.hibernate.search.backend.impl.BatchedQueueingProcessor.prepareWorks(BatchedQueueingProcessor.java:73)
         at org.hibernate.search.backend.impl.PostTransactionWorkQueueSynchronization.beforeCompletion(PostTransactionWorkQueueSynchronization.java:87)
         at org.hibernate.search.backend.impl.EventSourceTransactionContext$DelegateToSynchronizationOnBeforeTx.doBeforeTransactionCompletion(EventSourceTransactionContext.java:191)
         ... 19 more
     Caused by: java.lang.ClassCastException: [Ljava.util.Date; cannot be cast to java.util.Date
         at org.hibernate.search.bridge.builtin.DateBridge.objectToString(DateBridge.java:90)
         at org.hibernate.search.bridge.builtin.impl.String2FieldBridgeAdaptor.set(String2FieldBridgeAdaptor.java:46)
         at org.hibernate.search.bridge.util.impl.ContextualExceptionBridgeHelper$OneWayConversionContextImpl.set(ContextualExceptionBridgeHelper.java:127)
         ... 30 more

Let me zoom a bit for you.

    Caused by: java.lang.ClassCastException: [Ljava.util.Date; cannot be cast to java.util.Date

What? `java.util.Date` cannot be cast to `java.util.Date`????
That is usually a good sign that you're mixing classloaders and that the two objects comes from different ones.
Except that in my unit test, I don't mess around with classloaders.

That's when it hit me.
Do you see the `[L`?
It means that the first type is not `java.util.Date` but `java.util.Date[]`.
Now the `ClassClastException` makes perfect sense.

Conclusion?

I'm a idiot or (preferred one) this error message needs a serious UX take over.
The code is dying already.
Why not take the few extra nanoseconds to represent the types in a readable way?

    Caused by: java.lang.ClassCastException: java.util.Date[] cannot be cast to java.util.Date

I lost 5 minutes instead of 5 seconds.
When you write your next error report or exception, think of the children!
Or rather the poor souls that will have to use your library or code.

You can find more info on the `[L` syntax [on stackoverflow](http://stackoverflow.com/questions/5085889/l-array-notation-where-does-it-come-from).
