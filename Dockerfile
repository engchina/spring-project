# Maven build container 

FROM harbor.server.local/library/maven:3.9.1-amazoncorretto-17-debian AS maven_build

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN --mount=type=cache,target=/root/.m2 mvn package
#RUN mvn package

#pull base image

FROM harbor.server.local/library/amazoncorretto:17-alpine3.17-jdk

#expose port 8080
EXPOSE 8080

#default command
CMD java -jar /data/hello-world-0.1.0.jar

#copy hello world to docker image from builder image

COPY --from=maven_build /tmp/target/hello-world-0.1.0.jar /data/hello-world-0.1.0.jar