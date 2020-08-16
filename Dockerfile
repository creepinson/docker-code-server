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
    && npm install -g pnpm \
    && pnpm i -g @coder/code-server

# add local files
COPY ./entrypoint.sh /entrypoint.sh

# ports and volumes
EXPOSE 8443

RUN chmod +x /entrypoint.sh
CMD [ "/entrypoint.sh" ]
