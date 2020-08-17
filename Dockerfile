FROM codercom/code-server:latest

# Install extra packages to use in vscode
RUN echo "$SUDO_PASSWORD" | sudo -S apt update && \
    sudo apt install -y nodejs python3-pip && \
    npm i -g pnpm
