FROM maven:3.8.1-openjdk-11 as BUILD
COPY . /opt/maven38/bin/
RUN mvn -f /opt/maven38/bin/pom.xml clean package

FROM tomcat 
COPY --from=BUILD /opt/maven38/bin/target/petclinic.war /opt/tomcat/webapps
