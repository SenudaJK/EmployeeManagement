# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper and the pom.xml
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Ensure the Maven wrapper script is executable
RUN chmod +x mvnw

# Download dependencies
RUN ./mvnw dependency:go-offline --batch-mode

# Copy the project source
COPY src ./src

# Package the application and print logs
RUN ./mvnw package --batch-mode || { cat target/build.log; exit 1; }

# Run the jar file
CMD ["java", "-jar", "target/employee-0.0.1-SNAPSHOT.jar"]