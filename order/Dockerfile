FROM openjdk:8-jre-alpine
VOLUME /tmp
ADD ./target/order-0.0.1-SNAPSHOT.jar order.jar
EXPOSE 8086  
ENTRYPOINT ["java","-jar","/order.jar"]