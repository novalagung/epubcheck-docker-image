FROM openjdk:7

RUN apt-get install curl unzip

ARG EPUBCHECK_VERSION=4.2.2
WORKDIR /tmp
RUN export EPUBCHECK_VERSION=${EPUBCHECK_VERSION}
RUN curl -L -O "https://github.com/w3c/epubcheck/releases/download/v${EPUBCHECK_VERSION}/epubcheck-${EPUBCHECK_VERSION}.zip"
RUN unzip "./epubcheck-${EPUBCHECK_VERSION}.zip"

ENV DATA_PATH=/data
WORKDIR ${DATA_PATH}
VOLUME ${DATA_PATH}

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT [ "/tmp/entrypoint.sh" ]