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
    musl \
    busybox \
    alpine-baselayout \
    openrc \
    alpine-conf \
    libcrypto1.1 \
    libssl1.1 \
    ca-certificates-cacert \
    libtls-standalone \
    ssl_client \
    zlib \
    apk-tools \
    busybox-suid \
    busybox-initscripts \
    scanelf \
    musl-utils \
    libc-utils \
    alpine-keys \
    alpine-base \
    ca-certificates \
    c-ares \
    libgcc \
    libstdc++ \
    libuv \
    nodejs \
    npm \
    yarn \
    libmagic \
    ncurses-terminfo-base \
    ncurses-terminfo \
    ncurses-libs \
    openssh-keygen \
    libedit \
    openssh-client \
    openssh-sftp-server \
    openssh-server-common \
    openssh-server \
    openssh \
    screen \
    libssh2 \
    expat \
    git \
    libgpg-error \
    libassuan \
    libcap \
    pinentry \
    libbz2 \
    libgcrypt \
    gmp \
    nettle \
    libffi \
    p11-kit \
    libtasn1 \
    libunistring \
    gnutls \
    libksba \
    db \
    libsasl \
    libldap \
    npth \
    sqlite-libs \
    gnupg \
    keychain \
    gdbm \
    readline \
    xz-libs \
    python3 \
    gettext-asprintf \
    libintl \
    gettext-libs \
    libgomp \
    libxml2 \
    gettext \
    gettext-dev \
    pkgconf \
    zlib-dev \
    bzip2-dev \
    linux-headers \
    libffi-dev \
    libuuid \
    libblkid \
    libfdisk \
    libmount \
    libsmartcols \
    util-linux-dev \
    libxml2-utils \
    libxslt \
    docbook-xml \
    docbook-xsl \
    pcre \
    glib \
    libpcre16 \
    libpcre32 \
    libpcrecpp \
    pcre-dev \
    glib-dev \
    libsecret \
    libsecret-dev \
    libxau \
    libbsd \
    libxdmcp \
    libxcb \
    libx11 \
    libxkbfile \
    xorgproto \
    libxau-dev \
    xcb-proto \
    libpthread-stubs \
    libxdmcp-dev \
    libxcb-dev \
    xtrans \
    libx11-dev \
    libxkbfile-dev \
    make \
    m4 \
    perl \
    autoconf \
    automake \
    binutils \
    isl \
    libatomic \
    mpc1 \
    gcc \
    musl-dev \
    libc-dev \
    g++ \
    bash \
    libltdl \
    libtool \
    nghttp2-libs \
    libcurl \
    pcre2 \
    nano \
    http-parser \
    python2 \
    openssl \
    curl \
    && curl -fsSL https://code-server.dev/install.sh | sh

# add local files
COPY ./entrypoint.sh /entrypoint.sh

# ports and volumes
EXPOSE 8443

RUN chmod +x /entrypoint.sh
CMD [ "/entrypoint.sh" ]
