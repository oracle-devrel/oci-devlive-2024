FROM --platform=linux/amd64 container-registry.oracle.com/java/jdk-no-fee-term:21-oraclelinux8 as build

RUN mkdir /opt/src
COPY . /opt/src
WORKDIR /opt/src
RUN ./gradlew clean build

FROM --platform=linux/amd64 container-registry.oracle.com/java/jdk-no-fee-term:21-oraclelinux8

VOLUME /tmp
COPY --from=build /opt/src/build/libs/*.jar /tmp/
RUN mkdir /app
RUN ls /tmp/*.jar | grep -v plain | xargs -I '{}' mv {} /app/service-mysql.jar

ENTRYPOINT ["java","-jar","/app/service-mysql.jar"]