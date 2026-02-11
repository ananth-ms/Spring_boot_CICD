# Use a lightweight JDK base image
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy Spring Boot JAR (Jenkins will build it first)
COPY target/maven_build-1.0-SNAPSHOT.jar app.jar

# Copy your YAML (if needed inside container)
COPY src/main/resources/application.yml /app/config/application.yml

# Expose the Spring Boot port
EXPOSE 8085

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar", "--spring.config.location=file:/app/config/application.yml"]
