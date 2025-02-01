FROM node:22.11

EXPOSE 3000

ENV USERNAME=kholstinevich

WORKDIR app

COPY package.json yarn.lock server.js .yarnrc.yml server.js entrypoint.sh ./
COPY .yarn .yarn

RUN chmod +x entrypoint.sh
RUN yarn

ENTRYPOINT ["./entrypoint.sh"]

# docker build -t server .
# docker run --name server -p 3000:8080 --mount type=bind,src=./volume/secrets.js,dst=/var/static/secrets.js server
