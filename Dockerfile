FROM gradle:6.2-jdk11

RUN mkdir -p /root/app
WORKDIR /root/app

COPY src ./src
COPY gradle ./gradle
COPY build.gradle settings.gradle gradlew gradlew.bat proto-descriptor-gen.sh ./

RUN ./gradlew shadowJar

ENV PORT 3000
CMD ["java", "-jar", "build/libs/kube-grpc-hello-all.jar"]
