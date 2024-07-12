##### Dockerfile #####
FROM maven:3.8.3-openjdk-17 as build
WORKDIR /src
COPY . .
RUN mvn install -DskipTests=true

# thay tương ứng các image đề xuất ở trên nếu không chạy
FROM eclipse-temurin:17.0.8.1_1-jre-ubi9-minimal 

RUN unlink /etc/localtime;ln -s  /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
COPY --from=build src/target/filename.jar /run/filename.jar

EXPOSE 8888

ENV JAVA_OPTIONS="-Xmx2048m -Xms256m"
ENTRYPOINT java -jar $JAVA_OPTIONS /run/filename.jar

# Base image list
# adoptopenjdk/openjdk15:alpine-jre
# openjdk:17-alpine
# openjdk:17.0.1-jdk-slim
# openjdk:17.0.2-jdk
# eclipse-temurin:8-jre-alpine
# eclipse-temurin:17_35-jdk-alpine
# eclipse-temurin:11-jre-alpine
# eclipse-temurin:17-jre-alpine
# eclipse-temurin:17.0.8.1_1-jre-ubi9-minimal
# eclipse-temurin:17-jre-jammy
# eclipse-temurin:17.0.8.1_1-jre-focal
# eclipse-temurin:17.0.8.1_1-jre-alpine
# eclipse-temurin:21-jre-alpine
# amazoncorretto:17.0.0-alpine
# amazoncorretto:8u382-al2023