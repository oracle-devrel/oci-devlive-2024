FROM openjdk:17-oracle
WORKDIR /spring
COPY target/AdMessage-1.0.1.jar ./AdMessage.jar
COPY src/main/resources/application.properties application.properties
ENTRYPOINT ["java","-jar","./AdMessage.jar","--spring.config.location=file:/spring/application.properties"]
