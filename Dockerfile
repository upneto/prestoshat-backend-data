# Maven
FROM maven:3-jdk-11
ADD . /prestoshat-backend-data
WORKDIR /prestoshat-backend-data
RUN ls -l
RUN mvn clean install

# Java App
FROM openjdk:11-jdk
VOLUME /tmp
COPY --from=0 "/prestoshat-backend-data/target/prestoshat-backend-data-*.jar" app.jar
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]