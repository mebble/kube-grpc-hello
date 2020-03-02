FROM gradle:6.2-jdk11

RUN mkdir -p /root/app
WORKDIR /root/app

COPY src ./src
COPY gradle ./gradle
COPY build.gradle settings.gradle gradlew gradlew.bat proto-descriptor-gen.sh ./

RUN ./gradlew build

ENV PORT 3000
CMD ["./gradlew", "run"]   # it downloads gradle again. it doesn't seem to use the build dir. Should I run the built jar instead?
