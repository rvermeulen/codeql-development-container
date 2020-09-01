FROM debian:stable-slim
ARG CODEQL_CLI_VERSION=v2.2.5
ARG CODEQL_REPO_REF=head
ARG GO_LANG_VERSION=1.15

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -yq update && apt-get -yq upgrade
RUN apt-get -yq install unzip git curl

COPY install-build-essentials.sh install-build-essentials.sh
RUN /bin/bash install-build-essentials.sh ${GO_LANG_VERSION}

RUN useradd -ms /bin/bash codeql
USER codeql
WORKDIR /home/codeql

COPY --chown=codeql install-codeql.sh install-codeql.sh
RUN /bin/bash install-codeql.sh ${CODEQL_CLI_VERSION} ${CODEQL_REPO_REF}

COPY --chown=codeql install-go-tools.sh install-go-tools.sh
RUN /bin/bash install-go-tools.sh

COPY --chown=codeql post-install.sh post-install.sh
RUN /bin/bash post-install.sh

ENTRYPOINT ["/home/codeql/codeql-home/codeql-cli/codeql"] 

