FROM linuxserver/code-server

# Install extra packages to use in vscode
RUN apt update && \
    apt install -y python3-pip && \
    npm i -g pnpm
