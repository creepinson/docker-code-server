FROM alpine:latest

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CODE_RELEASE
LABEL maintainer="Theo Paris"

# environment settings
ENV HOME="/config"

RUN echo "**** install runtime dependencies ****" && \
    apk add --no-cache \
    curl \
    git \
    jq \
    nano \
    net-tools \
    py3-pip \
    nodejs \
    npm \
    sudo && \
    echo "**** install code-server ****" && npm i -g pnpm && \
    if [ -z ${CODE_RELEASE+x} ]; then \
    CODE_RELEASE=$(curl -sX GET "https://api.github.com/repos/cdr/code-server/releases/latest" \
    | awk '/tag_name/{print $4;exit}' FS='[""]'); \
    fi && \
    CODE_VERSION=$(echo "$CODE_RELEASE") && \
    pnpm i -g code-server@"$CODE_VERSION" && \
    echo "**** clean up ****"

# add local files
COPY ./root /

# ports and volumes
EXPOSE 8443
