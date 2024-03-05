FROM --platform=linux/amd64 gradle:7.5-jdk17-alpine

WORKDIR '/'

RUN mkdir -p $HOME/app/
COPY /demo/build/libs/app.jar $HOME/app/app.jar

WORKDIR $HOME/app/
VOLUME ["/usr/local/tmp"]
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar ./app.jar $SPRING_OPTS" ]