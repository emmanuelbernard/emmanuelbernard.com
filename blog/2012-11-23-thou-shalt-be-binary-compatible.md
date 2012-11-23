---
title: Thou shalt be binary compatible
author: Emmanuel Bernard
layout: blog-post
tags: [Java]
---
I learned some new tricks today thanks to Gunnar around backward compatibilities
in Java.

## There is compatibility and compatibility

In Bean Validation, we need to fix a mistake I made. One easy solution is to create
a sub-interface and return that sub-interface.

    //API
    public interface Contract {
        public Result testMe();
        public Result testMeMore();

        public static interface Result {
            void doIt();
        }
    }

    //client code
    Contract contract = new ContractImpl();
    contract.testMeMore().doIt();

In our example, I need to add a new method to results coming from `testMeMore()`.
I thought of this approach:

    //API
    public interface Contract {
        public Result testMe();
        public ResultMore testMeMore();

        public static interface Result {
            void doIt();
        }

        public static interface ResultMore extends Result {
            void doItAgain();
        }
    }

    //client code
    Contract contract = new ContractImpl();
    contract.testMeMore().doIt();

This approach is source compatible: if I recompile the client code,
things will work perfectly. But it's not backward compatible at the 
binary level.

If you don't recompile the client code and simply update the API jar,
you will get a nasty exception

    Exception in thread "main" java.lang.NoSuchMethodError: com.jboss.test.Contract.testMe()Lcom/jboss/test/Contract$Result;

That's because the contract is now `com.jboss.test.Contract.testMe()Lcom/jboss/test/Contract$ResultMore`
and even if `Result` is a super interface, Java does not let go with it.

And since application deployed in Java EE 6 are supposed to work out of the box for
Java EE 7, we can't do that. Note that testing binary compatibilities is not
trivial.

## Use the erasure hack, Luke

The what? It turns out the Java designers already had this problem when they
introduced the generics type system. You can solve the problem by using
interception types.

    //API
    public interface Contract {
        public Result testMe();
        public <T extends Result & ResultMore> T testMeMore();

        public static interface Result {
            void doIt();
        }

        public static interface ResultMore extends Result {
            void doItAgain();
        }
    }

    //client code
    Contract contract = new ContractImpl();
    contract.testMeMore().doIt();

Because generic types are erased by their most left upper bounds which is 
`Result` in our case, things work out smoothly.

By the way, you can reproduce this ad nauseam.

    //API
    public interface Contract {
        public Result testMe();
        public <T extends Result & ResultMore & ResultUltimate> T testMeMore();

        public static interface Result {
            void doIt();
        }

        public static interface ResultMore extends Result {
            void doItAgain();
        }

        public static interface ResultUltimate extends Result {
            void doItForEver();
        }

    }

    //client code
    Contract contract = new ContractImpl();
    contract.testMeMore().doItAgain();

## Conclusion

Now the big question is, should we use this trick in Bean Validation to solve
[this problem](http://beanvalidation.org/proposals/BVAL-221/).
What's your take on it?
