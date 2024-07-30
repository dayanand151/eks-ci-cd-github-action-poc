FROM openjdk:17-jdk-slim AS runtime

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container
COPY ./demo/target/demo-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8088

# Command to run the application
CMD ["java", "-jar", "app.jar"]
