---
title: Adding color to Maven output
author: Emmanuel Bernard
tags: [tool]
date: 2015-07-27
---
Maven is quite verbose.
Finding the useful information when the test fails requires you to squint eyes.
Unless, you bring some coloring to the massive Maven output.

The state of color output in Maven is still quite messy.
Just [look at Arnaud's blog](http://www.aheritier.net/united-colors-of-maven/) to see how non user friendly that is.

## Enter maven-color

Enter Jean-Christophe and its [Maven Color](https://github.com/jcgay/maven-color) project.
The goal is to bring colorized maven console in an easy and cross platform way.

It's relatively easy to install (check the [README](https://github.com/jcgay/maven-color)),
and is even easier on Mac OS X

    brew tap jcgay/jcgay
    brew install maven-deluxe

From there you might need to unlink your brew maven install.

Usually, you are done.
Well, not if like me you use CheckStyle.

## SLF4J beam crossing

Unfortunately for me, it was failing on [Hibernate OGM](http://hibernate.org/ogm/).
The problem is that the CheckStyle plugin is compiled with the Maven 2.x version of SLF4J aka an old one.

This leads to funky errors like - in color mind you:

    ------------------------------------------------------------------------
    Failed to execute goal org.apache.maven.plugins:maven-checkstyle-plugin:2.12.1:checkstyle (check-style) on project hibernate-ogm-core: Execution check-style of goal org.apache.maven.plugins:maven-checkstyle-plugin:2.12.1:checkstyle failed: An API incompatibility was encountered while executing org.apache.maven.plugins:maven-checkstyle-plugin:2.12.1:checkstyle: java.lang.NoSuchMethodError: org.slf4j.spi.LocationAwareLogger.log(Lorg/slf4j/Marker;Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    -----------------------------------------------------
    realm =    plugin>org.apache.maven.plugins:maven-checkstyle-plugin:2.12.1
    strategy = org.codehaus.plexus.classworlds.strategy.SelfFirstStrategy
    urls[0] = file:/Users/emmanuel/.m2/repository/org/apache/maven/plugins/maven-checkstyle-plugin/2.12.1/maven-checkstyle-plugin-2.12.1.jar
    urls[1] = file:/Users/emmanuel/.m2/repository/org/slf4j/slf4j-jdk14/1.5.6/slf4j-jdk14-1.5.6.jar
    urls[2] = file:/Users/emmanuel/.m2/repository/org/slf4j/jcl-over-slf4j/1.5.6/jcl-over-slf4j-1.5.6.jar
    urls[3] = file:/Users/emmanuel/.m2/repository/commons-cli/commons-cli/1.2/commons-cli-1.2.jar
    urls[4] = file:/Users/emmanuel/.m2/repository/org/codehaus/plexus/plexus-interactivity-api/1.0-alpha-4/plexus-interactivity-api-1.0-alpha-4.jar
    urls[5] = file:/Users/emmanuel/.m2/repository/backport-util-concurrent/backport-util-concurrent/3.1/backport-util-concurrent-3.1.jar
    urls[6] = file:/Users/emmanuel/.m2/repository/org/sonatype/plexus/plexus-sec-dispatcher/1.3/plexus-sec-dispatcher-1.3.jar
    urls[7] = file:/Users/emmanuel/.m2/repository/org/sonatype/plexus/plexus-cipher/1.4/plexus-cipher-1.4.jar
    urls[8] = file:/Users/emmanuel/.m2/repository/org/apache/maven/reporting/maven-reporting-api/3.0/maven-reporting-api-3.0.jar
    urls[9] = file:/Users/emmanuel/.m2/repository/org/apache/maven/reporting/maven-reporting-impl/2.2/maven-reporting-impl-2.2.jar
    urls[10] = file:/Users/emmanuel/.m2/repository/org/apache/maven/doxia/doxia-core/1.2/doxia-core-1.2.jar
    urls[11] = file:/Users/emmanuel/.m2/repository/xerces/xercesImpl/2.9.1/xercesImpl-2.9.1.jar
    urls[12] = file:/Users/emmanuel/.m2/repository/xml-apis/xml-apis/1.3.04/xml-apis-1.3.04.jar
    urls[13] = file:/Users/emmanuel/.m2/repository/org/apache/httpcomponents/httpclient/4.0.2/httpclient-4.0.2.jar
    urls[14] = file:/Users/emmanuel/.m2/repository/org/apache/httpcomponents/httpcore/4.0.1/httpcore-4.0.1.jar
    urls[15] = file:/Users/emmanuel/.m2/repository/commons-codec/commons-codec/1.3/commons-codec-1.3.jar
    urls[16] = file:/Users/emmanuel/.m2/repository/commons-validator/commons-validator/1.3.1/commons-validator-1.3.1.jar
    urls[17] = file:/Users/emmanuel/.m2/repository/commons-beanutils/commons-beanutils/1.7.0/commons-beanutils-1.7.0.jar
    urls[18] = file:/Users/emmanuel/.m2/repository/commons-digester/commons-digester/1.6/commons-digester-1.6.jar
    urls[19] = file:/Users/emmanuel/.m2/repository/commons-logging/commons-logging/1.0.4/commons-logging-1.0.4.jar
    urls[20] = file:/Users/emmanuel/.m2/repository/org/apache/maven/doxia/doxia-sink-api/1.4/doxia-sink-api-1.4.jar
    urls[21] = file:/Users/emmanuel/.m2/repository/org/apache/maven/doxia/doxia-logging-api/1.4/doxia-logging-api-1.4.jar
    urls[22] = file:/Users/emmanuel/.m2/repository/org/apache/maven/doxia/doxia-decoration-model/1.4/doxia-decoration-model-1.4.jar
    urls[23] = file:/Users/emmanuel/.m2/repository/org/apache/maven/doxia/doxia-site-renderer/1.4/doxia-site-renderer-1.4.jar
    urls[24] = file:/Users/emmanuel/.m2/repository/org/apache/maven/doxia/doxia-module-xhtml/1.4/doxia-module-xhtml-1.4.jar
    urls[25] = file:/Users/emmanuel/.m2/repository/org/apache/maven/doxia/doxia-module-fml/1.4/doxia-module-fml-1.4.jar
    urls[26] = file:/Users/emmanuel/.m2/repository/org/codehaus/plexus/plexus-i18n/1.0-beta-7/plexus-i18n-1.0-beta-7.jar
    urls[27] = file:/Users/emmanuel/.m2/repository/org/apache/velocity/velocity-tools/2.0/velocity-tools-2.0.jar
    urls[28] = file:/Users/emmanuel/.m2/repository/commons-chain/commons-chain/1.1/commons-chain-1.1.jar
    urls[29] = file:/Users/emmanuel/.m2/repository/dom4j/dom4j/1.1/dom4j-1.1.jar
    urls[30] = file:/Users/emmanuel/.m2/repository/sslext/sslext/1.2-0/sslext-1.2-0.jar
    urls[31] = file:/Users/emmanuel/.m2/repository/org/apache/struts/struts-core/1.3.8/struts-core-1.3.8.jar
    urls[32] = file:/Users/emmanuel/.m2/repository/org/apache/struts/struts-taglib/1.3.8/struts-taglib-1.3.8.jar
    urls[33] = file:/Users/emmanuel/.m2/repository/org/apache/struts/struts-tiles/1.3.8/struts-tiles-1.3.8.jar
    urls[34] = file:/Users/emmanuel/.m2/repository/org/apache/maven/shared/maven-doxia-tools/1.4/maven-doxia-tools-1.4.jar
    urls[35] = file:/Users/emmanuel/.m2/repository/commons-io/commons-io/1.4/commons-io-1.4.jar
    urls[36] = file:/Users/emmanuel/.m2/repository/junit/junit/3.8.1/junit-3.8.1.jar
    urls[37] = file:/Users/emmanuel/.m2/repository/org/codehaus/plexus/plexus-component-annotations/1.5.5/plexus-component-annotations-1.5.5.jar
    urls[38] = file:/Users/emmanuel/.m2/repository/org/codehaus/plexus/plexus-resources/1.0-alpha-7/plexus-resources-1.0-alpha-7.jar
    urls[39] = file:/Users/emmanuel/.m2/repository/org/codehaus/plexus/plexus-utils/3.0.15/plexus-utils-3.0.15.jar
    urls[40] = file:/Users/emmanuel/.m2/repository/org/codehaus/plexus/plexus-interpolation/1.19/plexus-interpolation-1.19.jar
    urls[41] = file:/Users/emmanuel/.m2/repository/org/codehaus/plexus/plexus-velocity/1.1.8/plexus-velocity-1.1.8.jar
    urls[42] = file:/Users/emmanuel/.m2/repository/com/puppycrawl/tools/checkstyle/5.7/checkstyle-5.7.jar
    urls[43] = file:/Users/emmanuel/.m2/repository/antlr/antlr/2.7.7/antlr-2.7.7.jar
    urls[44] = file:/Users/emmanuel/.m2/repository/commons-beanutils/commons-beanutils-core/1.8.3/commons-beanutils-core-1.8.3.jar
    urls[45] = file:/Users/emmanuel/.m2/repository/com/google/guava/guava-jdk5/14.0.1/guava-jdk5-14.0.1.jar
    urls[46] = file:/Users/emmanuel/.m2/repository/org/apache/velocity/velocity/1.5/velocity-1.5.jar
    urls[47] = file:/Users/emmanuel/.m2/repository/commons-lang/commons-lang/2.1/commons-lang-2.1.jar
    urls[48] = file:/Users/emmanuel/.m2/repository/oro/oro/2.0.8/oro-2.0.8.jar
    urls[49] = file:/Users/emmanuel/.m2/repository/commons-collections/commons-collections/3.2.1/commons-collections-3.2.1.jar
    Number of foreign imports: 1
    import: Entry[import  from realm ClassRealm[maven.api, parent: null]]
    
    -----------------------------------------------------
    -> [Help 1]

There is a relatively easy fix.
You can force the SLF4J version of CheckStyle in your plugin dependencies.

    <plugin>
        <artifactId>maven-checkstyle-plugin</artifactId>
        <version>2.15</version>
        <dependencies>
            <dependency>
                <groupId>org.slf4j</groupId>
                <artifactId>jcl-over-slf4j</artifactId>
                <version>1.7.5</version>
            </dependency>
            <dependency>
                <groupId>org.slf4j</groupId>
                <artifactId>slf4j-jdk14</artifactId>
                <version>1.7.5</version>
            </dependency>
        </dependencies>
    </plugin>

Now I can get spanked by CheckStyle in color!

If like me you drawn in Maven outputs,
go give a try to [Maven Color](https://github.com/jcgay/maven-color).
And many thanks to Jean-Christophe for his help in solving the CheckStyle of death problem.
