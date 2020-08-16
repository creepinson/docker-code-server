FROM linuxserver/code-server

# Install extra packages to use in vscode
RUN apt update && \
    apt install -y python3-pip && \
    npm i -g pnpm

CMD [ "bash", "-c", "export PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;) && export SUDO_PASSWORD=$PASSWORD && echo $PASSWORD && while true; do echo 'Hit CTRL+C to exit...'; sleep 10; done" ]
