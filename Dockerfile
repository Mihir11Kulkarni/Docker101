FROM maven:3.6.3-jdk-8 as Base1
RUN apt-get update
WORKDIR /app
RUN gitclonehttps://mihirkulkarni11@dev.azure.com/mihirkulkarni11/MavenBuild/_git/DOCKERMyShuttle
WORKDIR /app/DOCKERMyShuttle 
RUN mvn clean package -DskipTests

FROM tomcat:9.0.82-jre8-temurin-jammy
COPY --from=Base1 /app/DOCKERMyShuttle/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080