FROM java:8
COPY /target/serverlessToolchainJava-1.0.jar serverlessToolchainJava-1.0.jar
EXPOSE 8880
CMD ["sh", "-c", "java -jar serverlessToolchainJava-1.0.jar"]

