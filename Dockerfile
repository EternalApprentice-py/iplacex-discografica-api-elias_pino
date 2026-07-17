# Etapa 1: Construcción rápida usando Gradle con JDK 21
FROM eclipse-temurin:21-jdk-jammy AS build
WORKDIR /app
COPY . .
# Damos permisos de ejecución y compilamos omitiendo los tests para ahorrar RAM y tiempo
RUN chmod +x gradlew
RUN ./gradlew bootJar -x test

# Etapa 2: Imagen de ejecución ligera con parámetros agresivos de memoria
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
# Copiamos el archivo JAR generado en la etapa anterior
COPY --from=build /app/build/libs/*.jar app.jar

# Exponemos el puerto estándar
EXPOSE 8080

# Forzamos la JVM a usar el recolector de basura Serial y reducimos la pila al mínimo
ENTRYPOINT ["java", "-XX:+UseSerialGC", "-Xss256k", "-XX:MaxRAMPercentage=60.0", "-jar", "app.jar"]