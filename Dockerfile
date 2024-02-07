FROM maven:latest

WORKDIR /appseal
COPY . .
RUN apt-get update && apt-get install -y apktool
RUN mkdir /logs
RUN mkdir /apks
RUN mkdir /decompiled
RUN mvn clean install -Dmaven.test.skip=true
CMD mvn spring-boot:run