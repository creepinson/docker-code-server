# docker-code-server

A docker-compose file that runs two [code-server](https://github.com/cdr/code-server) instances for two users. 

This script requires two .env files to get set up. One file is called `.server-1.env` and the other is `.server-2.env`.
Both .env files should contain the following:
```
SUDO_PASSWORD=1234
PASSWORD=1234
```
I recommend that you set the passwords to something random and secure. You can set the sudo password and normal password to each other though. 
Once you have the environment files set up, you can run `docker-compose up  -d` in the root of this project to start the servers. Then you can login via the ports.
I recommend using something like [nginx proxy manager](https://nginxproxymanager.com/) to forward the ports to a subdomain for easy-access.
