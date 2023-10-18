# Docker101
# Dockerfile for Building and Deploying a Maven-Based Java Web Application with Tomcat

This Dockerfile is used to create a Docker image for building and deploying a Java web application using Maven and Tomcat.

## Build Stage (Base1)

In the first stage, it uses a Maven base image to build the Java web application from source code. It follows these steps:

1. Use `maven:3.6.3-jdk-8` as the base image.
2. Update the package list with `apt-get update`.
3. Set the working directory to `/app`.
4. Clone the source code from Azure DevOps using Git.
5. Navigate to the cloned project directory (`/app/DOCKERMyShuttle`).
6. Build the project using Maven, cleaning and packaging the application with tests skipped.

## Final Stage (Tomcat Deployment)

In the second stage, it uses a lightweight Tomcat image to deploy the web application. It follows these steps:

1. Use `tomcat:9.0.82-jre8-temurin-jammy` as the base image.
2. Copy the compiled WAR file from the previous stage into the Tomcat webapps directory.
3. Expose port 8080 for Tomcat.

This Dockerfile can be used to automate the build and deployment process of a Java web application with Maven and Tomcat.

## Usage

You can build and run the Docker image with the following commands:

```bash
docker build -t your-image-name .
docker run -d -p 8080:8080 your-image-name
