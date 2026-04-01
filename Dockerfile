# Step 1: Build jar
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Run app
FROM eclipse-temurin:17-jdk
COPY --from=build /app/target/chatapp-0.0.1-SNAPSHOT.jar app.jar

# 👇 VERY IMPORTANT
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]