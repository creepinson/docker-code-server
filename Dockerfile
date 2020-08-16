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
    npm i -g yarn && \
    echo "**** install code-server ****" && \
    if [ -z ${CODE_RELEASE+x} ]; then \
    CODE_RELEASE=$(curl -sX GET "https://api.github.com/repos/cdr/code-server/releases/latest" \
    | awk '/tag_name/{print $4;exit}' FS='[""]'); \
    fi && \
    CODE_VERSION=$(echo "$CODE_RELEASE") && \
    yarn global add code-server@"$CODE_VERSION" && \
    echo "**** clean up ****"

# add local files
COPY ./root/entrypoint.sh /entrypoint.sh

# ports and volumes
EXPOSE 8443

RUN chmod +x /entrypoint.sh
CMD [ "/entrypoint.sh" ]
