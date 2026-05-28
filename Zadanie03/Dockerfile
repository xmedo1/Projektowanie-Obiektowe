FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY AuthService/ .

EXPOSE 8080

ENTRYPOINT ["./gradlew", "bootRun"]