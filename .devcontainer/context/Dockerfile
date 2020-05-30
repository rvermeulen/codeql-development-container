FROM debian:stable-slim
ARG CODEQL_VERSION=v2.1.4

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -yq update && apt-get -yq upgrade
# Create the following directory structure to prevent symbolic link errors when installing openjdk
RUN mkdir -p /usr/share/man/man1
RUN apt-get -yq install unzip git curl openjdk-11-jdk-headless maven build-essential golang
RUN useradd -ms /bin/bash codeql

USER codeql
WORKDIR /home/codeql
COPY --chown=codeql install-codeql.sh install-codeql.sh
RUN /bin/bash install-codeql.sh ${CODEQL_VERSION}

ENTRYPOINT ["/home/codeql/codeql-home/codeql-cli/codeql"] 

