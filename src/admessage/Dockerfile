FROM openjdk:17-oracle
WORKDIR /spring
COPY target/AdMessage-1.0.0.jar ./AdMessage.jar
COPY application.properties application.properties
ENTRYPOINT ["java","-jar","./AdMessage.jar","--spring.config.location=file:/spring/application.properties"]
