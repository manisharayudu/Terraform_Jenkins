FROM openjdk:8-jre-alpine
COPY target/hello-world:1.0-SNAPSHOT.jar /app.jar
EXPOSE 8081
CMD ["/usr/bin/java", "-jar", "/app.jar"]
