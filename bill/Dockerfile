FROM openjdk:8-jre-alpine
VOLUME /tmp
ADD ./target/bill-0.0.1-SNAPSHOT.jar bill.jar
EXPOSE 8092  
ENTRYPOINT ["java","-jar","/bill.jar"]