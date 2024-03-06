FROM --platform=linux/amd64 gradle:7.5-jdk17-alpine

WORKDIR /
RUN addgroup appuser && \
    adduser --home /home/appuser --shell /bin/false --gecos "" --disabled-password --ingroup appuser appuser
ENV HOME=/home/appuser
RUN mkdir -p $HOME/app/
RUN chown -R appuser:appuser $HOME
COPY ./app.jar $HOME/app/app.jar
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
WORKDIR $HOME/app/
VOLUME ["/usr/local/tmp"]
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar ./app.jar $SPRING_OPTS" ]