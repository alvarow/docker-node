FROM alpine:latest
MAINTAINER Alvaro Reguly

# Exclude caches from the image
VOLUME /var/cache/apk /root/.npm

# Update
RUN apk add --update g++ nodejs-lts g++ ca-certificates

WORKDIR /app
EXPOSE  8080

# Install app and dependencies
ADD .npmrc /root/.npmrc
ADD . /app
RUN cd /app; npm install

CMD [ "npm", "start" ]
