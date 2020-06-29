FROM openjdk:8-jre-alpine
VOLUME /tmp
ADD ./target/logistic-0.0.1-SNAPSHOT.jar logistic.jar
EXPOSE 8091  
ENTRYPOINT ["java","-jar","/logistic.jar"]