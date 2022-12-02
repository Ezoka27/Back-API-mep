FROM openjdk:17-jdk-slim as builder

EXPOSE 8080
COPY . /src
WORKDIR /src


RUN ls -al
RUN sh -c "./gradlew build --stacktrace"



FROM openjdk:17-oracle

COPY --from=builder /src/build/libs/covid-api.jar /app/app.jar

RUN ["java", "-jar", "/app/app.jar"]
