FROM openjdk:8-jre-alpine
VOLUME /tmp
ADD ./target/payment-0.0.1-SNAPSHOT.jar payment.jar
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/payment.jar"]