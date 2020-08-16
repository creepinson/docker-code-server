FROM linuxserver/code-server

RUN apt install python3-pip
RUN npm i -g pnpm
RUN export PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c10) && export SUDO_PASSWORD=$PASSWORD
