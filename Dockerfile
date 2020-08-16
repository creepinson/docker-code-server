FROM alpine:latest

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CODE_RELEASE
LABEL maintainer="Theo Paris"

# environment settings
ENV HOME="/config"

RUN echo "**** install runtime dependencies ****" \
    && apk add --no-cache \
        curl \
        git \
        jq \
        nano \
        net-tools \
        py3-pip \
        nodejs \
        npm \
        sudo \
    && curl -fsSL https://code-server.dev/install.sh | sh

# add local files
COPY ./root/entrypoint.sh /entrypoint.sh

# ports and volumes
EXPOSE 8443

RUN chmod +x /entrypoint.sh
CMD [ "/entrypoint.sh" ]
