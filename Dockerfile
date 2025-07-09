FROM sensedia/openjdk24-base
VOLUME /tmp
COPY target/SosWebSpringApplication.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]