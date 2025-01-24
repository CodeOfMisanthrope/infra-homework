#FROM ubuntu:22.04
FROM node:22.11

EXPOSE 3000

ENV USERNAME=kholstinevich

WORKDIR app

COPY package.json yarn.lock server.js .yarnrc.yml server.js entrypoint.sh ./
#COPY server.js ./index.js
COPY .yarn .yarn
#COPY volume/secrets.js /var/static/

RUN chmod +x entrypoint.sh
RUN yarn

ENTRYPOINT ["./entrypoint.sh"]

# docker build -t server .
# docker run --name server --mount type=bind,src=./volume/secrets.js,dst=/var/static/secrets.js server
# docker run --name server -p 3000:8080 --network=host --mount type=bind,src=./volume/secrets.js,dst=/var/static/secrets.js server
# docker run --name server -p 3000:8080 --mount type=bind,src=./volume/secrets.js,dst=/var/static/secrets.js server
