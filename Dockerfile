FROM tomcat:8.5.89-jdk8-temurin-jammy
COPY ./target/tracking_systems-1.0.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]