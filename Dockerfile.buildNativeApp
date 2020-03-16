FROM maxday/graalvm-quarkus-cache:latest
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml -Pnative clean verify
