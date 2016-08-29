FROM alpine:latest
MAINTAINER Alvaro Reguly
LABEL Description="This image is used to start a sample node.js app on port 3000" Vendor="Alvaro Reguly" Version="1.0"

# Update
RUN apk upgrade --update \
 && apk add --no-cache --update nodejs-lts ca-certificates \
 && apk add --no-cache --update --virtual .build-deps g++ \
 && rm -rf /var/cache/apk/* 

# Install app and dependencies
ADD .npmrc /root/.npmrc
# install first to take advantage of Docker layers to cache the npm install
ADD package.json /app/
WORKDIR /app
RUN npm install
#RUN npm install && npm install -g pm2

# Delete things that were only needed by npm install
RUN apk del .build-deps \
 && rm -rf /root/.npm

# Now add app code
ADD . /app

EXPOSE  3000

CMD [ "node", "index.js" ]
#CMD ["pm2", "start", "pm2-processes.json", "--no-daemon"]
