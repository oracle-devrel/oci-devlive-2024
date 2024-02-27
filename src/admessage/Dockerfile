FROM openjdk:17-oracle
WORKDIR /spring
COPY target/admessage-1.0.1.jar ./admessage.jar
COPY src/main/resources/application.properties application.properties
ENTRYPOINT ["java","-jar","./admessage.jar","--spring.config.location=file:/spring/application.properties"]
