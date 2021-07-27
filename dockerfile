FROM maven:3.8.1-jdk-8 as BUILD
COPY . /usr/src/
RUN mvn -f /usr/src/pom.xml clean package

FROM tomcat 
COPY --from=BUILD /usr/src/target/petclinic.war /opt/tomcat/webapps