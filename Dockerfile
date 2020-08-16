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
    build-base \
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
    CODE_VERSION=$(echo "$CODE_RELEASE" | awk '{print substr($1,2); }') && \
    pnpm i -g code-server@"$CODE_VERSION" && \
    ln -s /node_modules/.bin/code-server /usr/bin/code-server && \
    echo "**** clean up ****" && \

# add local files
COPY /root /

# ports and volumes
EXPOSE 8443

RUN export PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c10) && \
    export SUDO_PASSWORD=$PASSWORD && \
    echo "Using password: $PASSWORD"
