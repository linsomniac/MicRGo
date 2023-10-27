# Multi-stage build: Build frontend and backend separately and then combine

# Stage 1: Build Frontend
FROM node:16 as frontend
WORKDIR /app
COPY real-estate-app/package*.json ./
RUN npm install
COPY real-estate-app/ ./
RUN npm run build

FROM gradle:6.9-jdk17-jammy AS bebuild

ENV GRADLE_USER_HOME $HOME/.gradle
ENV GRADLE_OPTS "-Dorg.gradle.daemon=false"
ENV GIT_SUBMODULE_STRATEGY recursive

RUN mkdir build
COPY . build
WORKDIR build

RUN /bin/sh gradlew build
#RUN bash -c "find / -name \*.jar "

#FROM maven:latest as bebuild
#WORKDIR /app
#COPY . ./
#RUN mvn clean package

# Stage 2: Build Backend and copy frontend build
FROM openjdk:11-jre-slim as backend
WORKDIR /app

COPY --from=bebuild /home/gradle/build/build/libs/build-0.0.1-SNAPSHOT.jar ./app.jar
#/home/gradle/build/build/libs/build-0.0.1-SNAPSHOT-plain.jar

COPY --from=frontend /app/dist ./static
CMD ["java", "-jar", "app.jar"]
