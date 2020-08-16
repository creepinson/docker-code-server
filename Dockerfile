FROM linuxserver/code-server

RUN apt install python3-pip
RUN npm i -g pnpm
