FROM linuxserver/code-server

RUN export PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;) && export SUDO_PASSWORD=$PASSWORD && echo $PASSWORD

# Install extra packages to use in vscode
RUN apt update && \
    apt install -y python3-pip && \
    npm i -g pnpm