#!/bin/sh
export PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c10) && \
    export SUDO_PASSWORD=$PASSWORD && \
    echo "Using password: $PASSWORD"
    
/usr/bin/code-server \
			--bind-addr 0.0.0.0:8443 \
			--user-data-dir /config/data \
			--extensions-dir /config/extensions \
			--disable-telemetry \
			--auth "password" \
			"${PROXY_DOMAIN_ARG}" \
			/config/workspace
