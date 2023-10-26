# Multi-stage build: Build frontend and backend separately and then combine

# Stage 1: Build Frontend
FROM node:16 as frontend
WORKDIR /app
COPY real-estate-app/package*.json ./
RUN npm install
COPY real-estate-app/ ./
RUN npm run build

FROM maven:latest as bebuild
WORKDIR /app
COPY . ./
RUN mvn clean package

# Stage 2: Build Backend and copy frontend build
FROM openjdk:11-jre-slim as backend
WORKDIR /app
COPY --from=bebuild /app/target/realestatebackend-0.0.1-SNAPSHOT.jar ./app.jar
COPY --from=frontend /app/dist ./static
CMD ["java", "-jar", "app.jar"]
