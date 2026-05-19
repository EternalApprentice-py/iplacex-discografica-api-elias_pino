# Stage 1: Build con Gradle
FROM gradle:8.14.3-jdk21 AS build

WORKDIR /app

COPY . .

RUN gradle clean build -x test

# Stage 2: Ejecución con OpenJDK
FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY --from=build /app/build/libs/discografia-1.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]