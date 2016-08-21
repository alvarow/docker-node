FROM alpine:latest
MAINTAINER Alvaro Reguly

# Exclude caches from the image
VOLUME /var/cache/apk /root/.npm

# Update
RUN apk upgrade --update \
 && apk add --update nodejs-lts ca-certificates \
 && apk add --update --virtual build-dependencies g++ 

WORKDIR /app
EXPOSE  3000

# Install app and dependencies
ADD .npmrc /root/.npmrc
ADD . /app
RUN cd /app; npm install
RUN apk del build-dependencies

CMD [ "npm", "start" ]
