FROM oracle/graalvm-ce:19.0.0 as graalvm
WORKDIR /home/app/graal-reflection-demo
COPY ./target/graal-reflection-demo.jar .
RUN gu install native-image
RUN native-image --no-server --verbose -jar ./graal-reflection-demo.jar
