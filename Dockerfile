FROM alpine:latest
MAINTAINER Alvaro Reguly
LABEL Description="This image is used to start a sample node.js app on port 3000" Vendor="Alvaro Reguly" Version="1.0"

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
RUN cd /app; npm install ; npm install -g pm2
RUN apk del build-dependencies

CMD [ "node", "index.js" ]
#CMD ["pm2", "start", "pm2-processes.json", "--no-daemon"]
