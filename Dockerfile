FROM --platform=linux/amd64 gradle:7.5-jdk17-alpine

WORKDIR /
RUN useradd -m appuser
USER appuser
RUN mkdir -p $HOME/app/
COPY ./app.jar $HOME/app/app.jar
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
WORKDIR $HOME/app/
VOLUME ["/usr/local/tmp"]
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar ./app.jar $SPRING_OPTS" ]