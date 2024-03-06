FROM --platform=linux/amd64 gradle:7.5-jdk17-alpine

WORKDIR /
USER root
RUN adduser -s /sbin/nologin -D appuser
USER appuser

ENV HOME=/home/appuser
RUN mkdir -p $HOME/app/
RUN chown -R appuser:appuser $HOME

COPY ./app.jar $HOME/app/
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar ./app.jar $SPRING_OPTS" ]