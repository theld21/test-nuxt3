FROM node:18.7-alpine

RUN apk update && apk add yarn

RUN mkdir /frontend
WORKDIR /frontend
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
EXPOSE 3000