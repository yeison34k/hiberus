FROM openjdk:8-jre-alpine
VOLUME /tmp
ADD ./target/eureka-server-0.0.1-SNAPSHOT.jar eureka-server.jar
EXPOSE 8181  
ENTRYPOINT ["java","-jar","/eureka-server.jar"]