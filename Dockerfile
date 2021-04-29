FROM maven:3-openjdk-8 AS MVN
RUN git clone https://github.com/wakaleo/game-of-life.git && cd game-of-life/ && mvn package


FROM tomcat:8-jdk8-openjdk
LABEL author="Pravin_Kumar" emailID="pkpk210697@gmail.com"
RUN apt-get update -y
COPY --from=MVN source /usr/local/tomcat/webapps/
EXPOSE 8080
