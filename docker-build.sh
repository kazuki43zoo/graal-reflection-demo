AP_NAME=graal-reflection-demo
./mvnw clean package
docker build . -t ${AP_NAME}
docker run -it ${AP_NAME} bash
