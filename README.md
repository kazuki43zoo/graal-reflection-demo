# graal-reflection-demo

This project provide sample for calling the default method using reflection. But it does not build image...

```
$ ./docker-build.sh
```

```
[INFO] Scanning for projects...
[INFO] 
[INFO] -----------------< com.example:graal-reflection-demo >------------------
[INFO] Building graal-reflection-demo 1.0.0-SNAPSHOT
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ graal-reflection-demo ---
[INFO] Deleting /Users/shimizukazuki/git-me/graal-reflection-demo/target
[INFO] 
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ graal-reflection-demo ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 3 resources
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ graal-reflection-demo ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 2 source files to /Users/shimizukazuki/git-me/graal-reflection-demo/target/classes
[INFO] 
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ graal-reflection-demo ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /Users/shimizukazuki/git-me/graal-reflection-demo/src/test/resources
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ graal-reflection-demo ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ graal-reflection-demo ---
[INFO] No tests to run.
[INFO] 
[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ graal-reflection-demo ---
[INFO] Building jar: /Users/shimizukazuki/git-me/graal-reflection-demo/target/graal-reflection-demo.jar
[INFO] 
[INFO] --- maven-shade-plugin:3.1.0:shade (default) @ graal-reflection-demo ---
[INFO] Replacing original artifact with shaded artifact.
[INFO] Replacing /Users/shimizukazuki/git-me/graal-reflection-demo/target/graal-reflection-demo.jar with /Users/shimizukazuki/git-me/graal-reflection-demo/target/graal-reflection-demo-1.0.0-SNAPSHOT-shaded.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  2.316 s
[INFO] Finished at: 2019-06-04T23:59:54+09:00
[INFO] ------------------------------------------------------------------------
Sending build context to Docker daemon  284.7kB
Step 1/5 : FROM oracle/graalvm-ce:19.0.0 as graalvm
 ---> d413331a996d
Step 2/5 : WORKDIR /home/app/graal-reflection-demo
 ---> Using cache
 ---> c1d284ef8fcb
Step 3/5 : COPY ./target/graal-reflection-demo.jar .
 ---> 5b7dbd9bbc4a
Step 4/5 : RUN gu install native-image
 ---> Running in 7acf1044f332
Downloading: Component catalog from www.graalvm.org
Processing component archive: Native Image
Downloading: Component native-image: Native Image  from github.com
Installing new component: Native Image licence files (org.graalvm.native-image, version 19.0.0)
Refreshed alternative links in /usr/bin/
Removing intermediate container 7acf1044f332
 ---> c4d99b7d80b6
Step 5/5 : RUN native-image --no-server --verbose -jar ./graal-reflection-demo.jar
 ---> Running in 968dd7974500
Apply jar:file:///home/app/graal-reflection-demo/graal-reflection-demo.jar!/META-INF/native-image/native-image.properties
Executing [
/opt/graalvm-ce-19.0.0/bin/java \
-XX:+UnlockExperimentalVMOptions \
-XX:+EnableJVMCI \
-XX:-UseJVMCICompiler \
-Dtruffle.TrustAllTruffleRuntimeProviders=true \
-Dtruffle.TruffleRuntime=com.oracle.truffle.api.impl.DefaultTruffleRuntime \
-Dgraalvm.ForcePolyglotInvalid=true \
-Dgraalvm.locatorDisabled=true \
-d64 \
-XX:-UseJVMCIClassLoader \
-Xss10m \
-Xms1g \
-Xmx1676695960 \
-Duser.country=US \
-Duser.language=en \
-Dorg.graalvm.version=19.0.0 \
-Dorg.graalvm.config=CE \
-Dcom.oracle.graalvm.isaot=true \
-Djvmci.class.path.append=/opt/graalvm-ce-19.0.0/jre/lib/jvmci/graal.jar \
-Xbootclasspath/a:/opt/graalvm-ce-19.0.0/jre/lib/boot/graaljs-scriptengine.jar:/opt/graalvm-ce-19.0.0/jre/lib/boot/graal-sdk.jar \
-cp \
/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/llvm-wrapper.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/objectfile.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/pointsto.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/graal-llvm.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/svm.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/javacpp.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/svm-llvm.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/llvm-platform-specific.jar:/opt/graalvm-ce-19.0.0/jre/lib/jvmci/jvmci-hotspot.jar:/opt/graalvm-ce-19.0.0/jre/lib/jvmci/graal-management.jar:/opt/graalvm-ce-19.0.0/jre/lib/jvmci/jvmci-api.jar:/opt/graalvm-ce-19.0.0/jre/lib/jvmci/graal.jar \
com.oracle.svm.hosted.NativeImageGeneratorRunner \
-watchpid \
1 \
-imagecp \
/opt/graalvm-ce-19.0.0/jre/lib/boot/graaljs-scriptengine.jar:/opt/graalvm-ce-19.0.0/jre/lib/boot/graal-sdk.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/llvm-wrapper.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/objectfile.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/pointsto.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/graal-llvm.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/svm.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/javacpp.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/svm-llvm.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/builder/llvm-platform-specific.jar:/opt/graalvm-ce-19.0.0/jre/lib/jvmci/jvmci-hotspot.jar:/opt/graalvm-ce-19.0.0/jre/lib/jvmci/graal-management.jar:/opt/graalvm-ce-19.0.0/jre/lib/jvmci/jvmci-api.jar:/opt/graalvm-ce-19.0.0/jre/lib/jvmci/graal.jar:/opt/graalvm-ce-19.0.0/jre/lib/svm/library-support.jar:/home/app/graal-reflection-demo/graal-reflection-demo.jar \
-H:Path=/home/app/graal-reflection-demo \
-H:Name=graal-reflection-demo \
-H:ReflectionConfigurationResources=META-INF/native-image/reflection-config.json \
-H:DynamicProxyConfigurationResources=META-INF/native-image/dynamic-proxy-config.json \
-H:Class=com.example.Application \
-H:+ReportExceptionStackTraces \
-H:+ReportUnsupportedElementsAtRuntime \
-H:CLibraryPath=/opt/graalvm-ce-19.0.0/jre/lib/svm/clibraries/linux-amd64
]
[graal-reflection-demo:6]    classlist:   2,270.48 ms
[graal-reflection-demo:6]        (cap):   1,032.68 ms
[graal-reflection-demo:6]        setup:   2,397.72 ms
[graal-reflection-demo:6]     analysis:  27,506.14 ms
Warning: Aborting stand-alone image build. Unsupported features in 5 methods
Detailed message:
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Invoke with MethodHandle argument could not be reduced to at most a single call: java.lang.invoke.MethodHandle.bindTo(Object)
Trace: 
        at parsing java.lang.invoke.MethodHandleImpl.makePairwiseConvertByEditor(MethodHandleImpl.java:221)
Call path from entry point to java.lang.invoke.MethodHandleImpl.makePairwiseConvertByEditor(MethodHandle, MethodType, boolean, boolean): 
        at java.lang.invoke.MethodHandleImpl.makePairwiseConvertByEditor(MethodHandleImpl.java:207)
        at java.lang.invoke.MethodHandleImpl.makePairwiseConvert(MethodHandleImpl.java:194)
        at java.lang.invoke.MethodHandleImpl.makePairwiseConvert(MethodHandleImpl.java:380)
        at java.lang.invoke.MethodHandle.asTypeUncached(MethodHandle.java:776)
        at java.lang.invoke.MethodHandle.asType(MethodHandle.java:761)
        at java.lang.invoke.MethodHandle.invokeWithArguments(MethodHandle.java:627)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Invoke with MethodHandle argument could not be reduced to at most a single call: java.lang.invoke.MethodHandleImpl$BindCaller.prepareForInvoker(MethodHandle)
Trace: 
        at parsing java.lang.invoke.MethodHandleImpl$BindCaller.makeInjectedInvoker(MethodHandleImpl.java:1166)
Call path from entry point to java.lang.invoke.MethodHandleImpl$BindCaller.makeInjectedInvoker(Class): 
        at java.lang.invoke.MethodHandleImpl$BindCaller.makeInjectedInvoker(MethodHandleImpl.java:1141)
        at java.lang.invoke.MethodHandleImpl$BindCaller.access$300(MethodHandleImpl.java:1122)
        at java.lang.invoke.MethodHandleImpl$BindCaller$1.computeValue(MethodHandleImpl.java:1175)
        at java.lang.invoke.MethodHandleImpl$BindCaller$1.computeValue(MethodHandleImpl.java:1173)
        at com.oracle.svm.core.jdk.Target_java_lang_ClassValue.get(JavaLangSubstitutions.java:512)
        at java.lang.invoke.MethodHandleImpl$BindCaller.bindCaller(MethodHandleImpl.java:1136)
        at java.lang.invoke.MethodHandleImpl.bindCaller(MethodHandleImpl.java:1117)
        at java.lang.invoke.MethodHandles$Lookup.maybeBindCaller(MethodHandles.java:1681)
        at java.lang.invoke.MethodHandles$Lookup.getDirectMethodCommon(MethodHandles.java:1669)
        at java.lang.invoke.MethodHandles$Lookup.getDirectMethodNoSecurityManager(MethodHandles.java:1617)
        at java.lang.invoke.MethodHandles$Lookup.unreflectSpecial(MethodHandles.java:1236)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Invoke with MethodHandle argument could not be reduced to at most a single call: java.lang.invoke.MethodHandleImpl.buildVarargsArray(MethodHandle, MethodHandle, int)
Trace: 
        at parsing java.lang.invoke.MethodHandleImpl.varargsArray(MethodHandleImpl.java:1634)
Call path from entry point to java.lang.invoke.MethodHandleImpl.varargsArray(Class, int): 
        at java.lang.invoke.MethodHandleImpl.varargsArray(MethodHandleImpl.java:1611)
        at java.lang.invoke.MethodHandleImpl$IntrinsicMethodHandle.asCollector(MethodHandleImpl.java:1363)
        at java.lang.invoke.MethodHandleImpl$AsVarargsCollector.asTypeUncached(MethodHandleImpl.java:502)
        at java.lang.invoke.MethodHandle.asType(MethodHandle.java:761)
        at java.lang.invoke.MethodHandle.invokeWithArguments(MethodHandle.java:627)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: type is not available in this platform: com.oracle.svm.core.locks.ClassInstanceReplacer
Trace:  object java.lang.Class[]
        object java.lang.invoke.MethodType
        object java.lang.invoke.MethodType$ConcurrentWeakInternSet$WeakEntry
        object java.util.concurrent.ConcurrentHashMap$Node
        object java.util.concurrent.ConcurrentHashMap$Node[]
        object java.util.concurrent.ConcurrentHashMap
        object java.lang.invoke.MethodType$ConcurrentWeakInternSet
        method java.lang.invoke.MethodType.makeImpl(Class, Class[], boolean)
Call path from entry point to java.lang.invoke.MethodType.makeImpl(Class, Class[], boolean): 
        at java.lang.invoke.MethodType.makeImpl(MethodType.java:301)
        at java.lang.invoke.MethodType.genericMethodType(MethodType.java:338)
        at java.lang.invoke.MethodType.genericMethodType(MethodType.java:356)
        at java.lang.invoke.MethodHandle.invokeWithArguments(MethodHandle.java:626)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: type is not available in this platform: org.graalvm.nativeimage.impl.ImageSingletonsSupport

com.oracle.svm.hosted.FallbackFeature$FallbackImageRequest: Aborting stand-alone image build. Unsupported features in 5 methods
Detailed message:
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Invoke with MethodHandle argument could not be reduced to at most a single call: java.lang.invoke.MethodHandle.bindTo(Object)
Trace: 
        at parsing java.lang.invoke.MethodHandleImpl.makePairwiseConvertByEditor(MethodHandleImpl.java:221)
Call path from entry point to java.lang.invoke.MethodHandleImpl.makePairwiseConvertByEditor(MethodHandle, MethodType, boolean, boolean): 
        at java.lang.invoke.MethodHandleImpl.makePairwiseConvertByEditor(MethodHandleImpl.java:207)
        at java.lang.invoke.MethodHandleImpl.makePairwiseConvert(MethodHandleImpl.java:194)
        at java.lang.invoke.MethodHandleImpl.makePairwiseConvert(MethodHandleImpl.java:380)
        at java.lang.invoke.MethodHandle.asTypeUncached(MethodHandle.java:776)
        at java.lang.invoke.MethodHandle.asType(MethodHandle.java:761)
        at java.lang.invoke.MethodHandle.invokeWithArguments(MethodHandle.java:627)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Invoke with MethodHandle argument could not be reduced to at most a single call: java.lang.invoke.MethodHandleImpl$BindCaller.prepareForInvoker(MethodHandle)
Trace: 
        at parsing java.lang.invoke.MethodHandleImpl$BindCaller.makeInjectedInvoker(MethodHandleImpl.java:1166)
Call path from entry point to java.lang.invoke.MethodHandleImpl$BindCaller.makeInjectedInvoker(Class): 
        at java.lang.invoke.MethodHandleImpl$BindCaller.makeInjectedInvoker(MethodHandleImpl.java:1141)
        at java.lang.invoke.MethodHandleImpl$BindCaller.access$300(MethodHandleImpl.java:1122)
        at java.lang.invoke.MethodHandleImpl$BindCaller$1.computeValue(MethodHandleImpl.java:1175)
        at java.lang.invoke.MethodHandleImpl$BindCaller$1.computeValue(MethodHandleImpl.java:1173)
        at com.oracle.svm.core.jdk.Target_java_lang_ClassValue.get(JavaLangSubstitutions.java:512)
        at java.lang.invoke.MethodHandleImpl$BindCaller.bindCaller(MethodHandleImpl.java:1136)
        at java.lang.invoke.MethodHandleImpl.bindCaller(MethodHandleImpl.java:1117)
        at java.lang.invoke.MethodHandles$Lookup.maybeBindCaller(MethodHandles.java:1681)
        at java.lang.invoke.MethodHandles$Lookup.getDirectMethodCommon(MethodHandles.java:1669)
        at java.lang.invoke.MethodHandles$Lookup.getDirectMethodNoSecurityManager(MethodHandles.java:1617)
        at java.lang.invoke.MethodHandles$Lookup.unreflectSpecial(MethodHandles.java:1236)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Invoke with MethodHandle argument could not be reduced to at most a single call: java.lang.invoke.MethodHandleImpl.buildVarargsArray(MethodHandle, MethodHandle, int)
Trace: 
        at parsing java.lang.invoke.MethodHandleImpl.varargsArray(MethodHandleImpl.java:1634)
Call path from entry point to java.lang.invoke.MethodHandleImpl.varargsArray(Class, int): 
        at java.lang.invoke.MethodHandleImpl.varargsArray(MethodHandleImpl.java:1611)
        at java.lang.invoke.MethodHandleImpl$IntrinsicMethodHandle.asCollector(MethodHandleImpl.java:1363)
        at java.lang.invoke.MethodHandleImpl$AsVarargsCollector.asTypeUncached(MethodHandleImpl.java:502)
        at java.lang.invoke.MethodHandle.asType(MethodHandle.java:761)
        at java.lang.invoke.MethodHandle.invokeWithArguments(MethodHandle.java:627)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: type is not available in this platform: com.oracle.svm.core.locks.ClassInstanceReplacer
Trace:  object java.lang.Class[]
        object java.lang.invoke.MethodType
        object java.lang.invoke.MethodType$ConcurrentWeakInternSet$WeakEntry
        object java.util.concurrent.ConcurrentHashMap$Node
        object java.util.concurrent.ConcurrentHashMap$Node[]
        object java.util.concurrent.ConcurrentHashMap
        object java.lang.invoke.MethodType$ConcurrentWeakInternSet
        method java.lang.invoke.MethodType.makeImpl(Class, Class[], boolean)
Call path from entry point to java.lang.invoke.MethodType.makeImpl(Class, Class[], boolean): 
        at java.lang.invoke.MethodType.makeImpl(MethodType.java:301)
        at java.lang.invoke.MethodType.genericMethodType(MethodType.java:338)
        at java.lang.invoke.MethodType.genericMethodType(MethodType.java:356)
        at java.lang.invoke.MethodHandle.invokeWithArguments(MethodHandle.java:626)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: type is not available in this platform: org.graalvm.nativeimage.impl.ImageSingletonsSupport

        at com.oracle.svm.hosted.FallbackFeature.reportFallback(FallbackFeature.java:210)
        at com.oracle.svm.hosted.FallbackFeature.reportAsFallback(FallbackFeature.java:220)
        at com.oracle.svm.hosted.NativeImageGenerator.runPointsToAnalysis(NativeImageGenerator.java:733)
        at com.oracle.svm.hosted.NativeImageGenerator.doRun(NativeImageGenerator.java:523)
        at com.oracle.svm.hosted.NativeImageGenerator.lambda$run$0(NativeImageGenerator.java:441)
        at java.util.concurrent.ForkJoinTask$AdaptedRunnableAction.exec(ForkJoinTask.java:1386)
        at java.util.concurrent.ForkJoinTask.doExec(ForkJoinTask.java:289)
        at java.util.concurrent.ForkJoinPool$WorkQueue.runTask(ForkJoinPool.java:1056)
        at java.util.concurrent.ForkJoinPool.runWorker(ForkJoinPool.java:1692)
        at java.util.concurrent.ForkJoinWorkerThread.run(ForkJoinWorkerThread.java:157)
Caused by: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Unsupported features in 5 methods
Detailed message:
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Invoke with MethodHandle argument could not be reduced to at most a single call: java.lang.invoke.MethodHandle.bindTo(Object)
Trace: 
        at parsing java.lang.invoke.MethodHandleImpl.makePairwiseConvertByEditor(MethodHandleImpl.java:221)
Call path from entry point to java.lang.invoke.MethodHandleImpl.makePairwiseConvertByEditor(MethodHandle, MethodType, boolean, boolean): 
        at java.lang.invoke.MethodHandleImpl.makePairwiseConvertByEditor(MethodHandleImpl.java:207)
        at java.lang.invoke.MethodHandleImpl.makePairwiseConvert(MethodHandleImpl.java:194)
        at java.lang.invoke.MethodHandleImpl.makePairwiseConvert(MethodHandleImpl.java:380)
        at java.lang.invoke.MethodHandle.asTypeUncached(MethodHandle.java:776)
        at java.lang.invoke.MethodHandle.asType(MethodHandle.java:761)
        at java.lang.invoke.MethodHandle.invokeWithArguments(MethodHandle.java:627)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Invoke with MethodHandle argument could not be reduced to at most a single call: java.lang.invoke.MethodHandleImpl$BindCaller.prepareForInvoker(MethodHandle)
Trace: 
        at parsing java.lang.invoke.MethodHandleImpl$BindCaller.makeInjectedInvoker(MethodHandleImpl.java:1166)
Call path from entry point to java.lang.invoke.MethodHandleImpl$BindCaller.makeInjectedInvoker(Class): 
        at java.lang.invoke.MethodHandleImpl$BindCaller.makeInjectedInvoker(MethodHandleImpl.java:1141)
        at java.lang.invoke.MethodHandleImpl$BindCaller.access$300(MethodHandleImpl.java:1122)
        at java.lang.invoke.MethodHandleImpl$BindCaller$1.computeValue(MethodHandleImpl.java:1175)
        at java.lang.invoke.MethodHandleImpl$BindCaller$1.computeValue(MethodHandleImpl.java:1173)
        at com.oracle.svm.core.jdk.Target_java_lang_ClassValue.get(JavaLangSubstitutions.java:512)
        at java.lang.invoke.MethodHandleImpl$BindCaller.bindCaller(MethodHandleImpl.java:1136)
        at java.lang.invoke.MethodHandleImpl.bindCaller(MethodHandleImpl.java:1117)
        at java.lang.invoke.MethodHandles$Lookup.maybeBindCaller(MethodHandles.java:1681)
        at java.lang.invoke.MethodHandles$Lookup.getDirectMethodCommon(MethodHandles.java:1669)
        at java.lang.invoke.MethodHandles$Lookup.getDirectMethodNoSecurityManager(MethodHandles.java:1617)
        at java.lang.invoke.MethodHandles$Lookup.unreflectSpecial(MethodHandles.java:1236)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Invoke with MethodHandle argument could not be reduced to at most a single call: java.lang.invoke.MethodHandleImpl.buildVarargsArray(MethodHandle, MethodHandle, int)
Trace: 
        at parsing java.lang.invoke.MethodHandleImpl.varargsArray(MethodHandleImpl.java:1634)
Call path from entry point to java.lang.invoke.MethodHandleImpl.varargsArray(Class, int): 
        at java.lang.invoke.MethodHandleImpl.varargsArray(MethodHandleImpl.java:1611)
        at java.lang.invoke.MethodHandleImpl$IntrinsicMethodHandle.asCollector(MethodHandleImpl.java:1363)
        at java.lang.invoke.MethodHandleImpl$AsVarargsCollector.asTypeUncached(MethodHandleImpl.java:502)
        at java.lang.invoke.MethodHandle.asType(MethodHandle.java:761)
        at java.lang.invoke.MethodHandle.invokeWithArguments(MethodHandle.java:627)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: type is not available in this platform: com.oracle.svm.core.locks.ClassInstanceReplacer
Trace:  object java.lang.Class[]
        object java.lang.invoke.MethodType
        object java.lang.invoke.MethodType$ConcurrentWeakInternSet$WeakEntry
        object java.util.concurrent.ConcurrentHashMap$Node
        object java.util.concurrent.ConcurrentHashMap$Node[]
        object java.util.concurrent.ConcurrentHashMap
        object java.lang.invoke.MethodType$ConcurrentWeakInternSet
        method java.lang.invoke.MethodType.makeImpl(Class, Class[], boolean)
Call path from entry point to java.lang.invoke.MethodType.makeImpl(Class, Class[], boolean): 
        at java.lang.invoke.MethodType.makeImpl(MethodType.java:301)
        at java.lang.invoke.MethodType.genericMethodType(MethodType.java:338)
        at java.lang.invoke.MethodType.genericMethodType(MethodType.java:356)
        at java.lang.invoke.MethodHandle.invokeWithArguments(MethodHandle.java:626)
        at com.example.Application.invokeDefaultMethod(Application.java:44)
        at com.example.Application.access$100(Application.java:11)
        at com.example.Application$MethodProxy.invoke(Application.java:26)
        at com.sun.proxy.$Proxy123.hello(Unknown Source)
        at com.example.Application.main(Application.java:17)
        at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:153)
        at com.oracle.svm.core.code.IsolateEnterStub.JavaMainWrapper_run_5087f5482cc9a6abc971913ece43acb471d2631b(generated:0)
Error: type is not available in this platform: org.graalvm.nativeimage.impl.ImageSingletonsSupport

        at com.oracle.graal.pointsto.constraints.UnsupportedFeatures.report(UnsupportedFeatures.java:133)
        at com.oracle.graal.pointsto.BigBang.finish(BigBang.java:564)
        at com.oracle.svm.hosted.NativeImageGenerator.runPointsToAnalysis(NativeImageGenerator.java:684)
        ... 7 more
Build on Server(pid: 76, port: 44059)*
[graal-reflection-demo:76]    classlist:   2,088.72 ms
[graal-reflection-demo:76]        (cap):     958.15 ms
[graal-reflection-demo:76]        setup:   2,424.71 ms
[graal-reflection-demo:76]   (typeflow):   3,905.13 ms
[graal-reflection-demo:76]    (objects):   1,292.02 ms
[graal-reflection-demo:76]   (features):     607.03 ms
[graal-reflection-demo:76]     analysis:   5,956.30 ms
[graal-reflection-demo:76]     (clinit):     508.05 ms
[graal-reflection-demo:76]     universe:     898.04 ms
[graal-reflection-demo:76]      (parse):     931.08 ms
[graal-reflection-demo:76]     (inline):   2,507.26 ms
[graal-reflection-demo:76]    (compile):   8,462.53 ms
[graal-reflection-demo:76]      compile:  12,231.41 ms
[graal-reflection-demo:76]        image:     509.30 ms
[graal-reflection-demo:76]        write:     237.06 ms
[graal-reflection-demo:76]      [total]:  24,581.55 ms
Warning: Image 'graal-reflection-demo' is a fallback image that requires a JDK for execution (use --no-fallback to suppress fallback image generation).
Removing intermediate container 968dd7974500
 ---> 8eb282426ed8
Successfully built 8eb282426ed8
Successfully tagged graal-reflection-demo:latest
bash-4.2# 
```