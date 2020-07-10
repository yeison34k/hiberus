FROM openjdk:8-jre-alpine
VOLUME /tmp
ADD ./target/gateway-server-0.0.1-SNAPSHOT.jar gateway-server.jar
EXPOSE 8181  
ENTRYPOINT ["java","-jar","/gateway-server.jar"]