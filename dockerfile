FROM java:8
COPY /target/serverlessToolchainJava-0.1.0-SNAPSHOT.jar serverlessToolchainJava-0.1.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["sh", "-c", "java -jar serverlessToolchainJava-0.1.0-SNAPSHOT.jar"]
