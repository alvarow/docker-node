# docker-node

A sample node.js Docker app on Alpine Linux using [docker][].

## Prerequisites

- [node.js & npm][node-js-download]

## Getting Started

        make install
	# npm install

-   Build docker image:

        make build
        # docker build -t alvaro/docker-node .

-   Run app:

        make run-container
        # docker run -p 8080:8080 -d alvaro/docker-node

-   Get mapped port (last column) using, e.g. 8080:

        docker ps

        > # Example
        > ID                  IMAGE                           COMMAND              CREATED             STATUS              PORTS
        > ecce33b30ebf        gasi/centos-node-hello:latest   node /src/index.js   10 seconds ago      Up 9 seconds        49160->8080

-   Test app using the port Docker exposed, e.g. 8080:

        make test
	# curl -i  http://localhost:8080/alvaro?hello=world

-  You should expect something like this:

#  Build
```
regulya@ROSELCDV0001LHJ:~/docker/alvaro$ docker build -t alvaro/docker-node .
Sending build context to Docker daemon 126.5 kB
Step 1 : FROM alpine:latest
 ---> 4e38e38c8ce0
Step 2 : MAINTAINER Alvaro Reguly
 ---> Running in d70213e5dc3f
 ---> e5af12b47187
Removing intermediate container d70213e5dc3f
Step 3 : VOLUME /var/cache/apk /root/.npm
 ---> Running in d795e94ea884
 ---> ef1d6b049451
Removing intermediate container d795e94ea884
Step 4 : RUN apk add --update g++ nodejs-lts g++ ca-certificates
 ---> Running in 2ce58f9f60a4
fetch http://dl-cdn.alpinelinux.org/alpine/v3.4/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.4/community/x86_64/APKINDEX.tar.gz
(1/21) Upgrading musl (1.1.14-r10 -> 1.1.14-r11)
(2/21) Installing ca-certificates (20160104-r4)
(3/21) Installing libgcc (5.3.0-r0)
(4/21) Installing libstdc++ (5.3.0-r0)
(5/21) Installing binutils-libs (2.26-r0)
(6/21) Installing binutils (2.26-r0)
(7/21) Installing gmp (6.1.0-r0)
(8/21) Installing isl (0.14.1-r0)
(9/21) Installing libgomp (5.3.0-r0)
(10/21) Installing libatomic (5.3.0-r0)
(11/21) Installing pkgconf (0.9.12-r0)
(12/21) Installing pkgconfig (0.25-r1)
(13/21) Installing mpfr3 (3.1.2-r0)
(14/21) Installing mpc1 (1.0.3-r0)
(15/21) Installing gcc (5.3.0-r0)
(16/21) Installing musl-dev (1.1.14-r11)
(17/21) Installing libc-dev (0.7-r0)
(18/21) Installing g++ (5.3.0-r0)
(19/21) Upgrading musl-utils (1.1.14-r10 -> 1.1.14-r11)
(20/21) Installing libuv (1.9.1-r0)
(21/21) Installing nodejs-lts (4.4.4-r0)
Executing busybox-1.24.2-r9.trigger
Executing ca-certificates-20160104-r4.trigger
OK: 183 MiB in 30 packages
 ---> d5021fa101f3
Removing intermediate container 2ce58f9f60a4
Step 5 : WORKDIR /app
 ---> Running in c58e27bd8a88
 ---> aaadc1f4f741
Removing intermediate container c58e27bd8a88
Step 6 : EXPOSE 8080
 ---> Running in 0d98f58c1d70
 ---> 90644ed2ecfb
Removing intermediate container 0d98f58c1d70
Step 7 : ADD .npmrc /root/.npmrc
 ---> ccc76d278212
Removing intermediate container 599c2c3621c9
Step 8 : ADD . /app
 ---> 41008d86eab7
Removing intermediate container 58cab0e64563
Step 9 : RUN cd /app; npm install
 ---> Running in 50caf6f7a1a9
express@4.14.0 node_modules/express
├── escape-html@1.0.3
├── array-flatten@1.1.1
├── cookie-signature@1.0.6
├── utils-merge@1.0.0
├── merge-descriptors@1.0.1
├── encodeurl@1.0.1
├── content-type@1.0.2
├── methods@1.1.2
├── fresh@0.3.0
├── content-disposition@0.5.1
├── cookie@0.3.1
├── etag@1.7.0
├── parseurl@1.3.1
├── range-parser@1.2.0
├── vary@1.1.0
├── path-to-regexp@0.1.7
├── serve-static@1.11.1
├── depd@1.1.0
├── qs@6.2.0
├── on-finished@2.3.0 (ee-first@1.1.1)
├── finalhandler@0.5.0 (unpipe@1.0.0, statuses@1.3.0)
├── debug@2.2.0 (ms@0.7.1)
├── proxy-addr@1.1.2 (forwarded@0.1.0, ipaddr.js@1.1.1)
├── send@0.14.1 (destroy@1.0.4, ms@0.7.1, statuses@1.3.0, mime@1.3.4, http-errors@1.5.0)
├── accepts@1.3.3 (negotiator@0.6.1, mime-types@2.1.11)
└── type-is@1.6.13 (media-typer@0.3.0, mime-types@2.1.11)
 ---> 0447f61c8bb5
Removing intermediate container 50caf6f7a1a9
Step 10 : CMD npm start
 ---> Running in 72e49fa48085
 ---> b716dbbb504f
Removing intermediate container 72e49fa48085
Successfully built b716dbbb504f
```
    
# run

```
regulya@ROSELCDV0001LHJ:~/docker/alvaro$ docker run -p 8080:8080 -d alvaro/docker-node
89b2652ec2c1f02d0101cc7c17e12f3a1c22b7c2a5f13f77fcc07c5dbeceaf2c
```

# test

```
regulya@ROSELCDV0001LHJ:~/docker/alvaro$ docker ps
CONTAINER ID        IMAGE                COMMAND             CREATED             STATUS              PORTS                    NAMES
89b2652ec2c1        alvaro/docker-node   "npm start"         4 seconds ago       Up 3 seconds        0.0.0.0:8080->8080/tcp   elegant_liskov

regulya@ROSELCDV0001LHJ:~/docker/alvaro$ curl -i localhost:8080/alvaro?hello=world
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 11
ETag: W/"b-GQD5JjsHsD1Y5z8TpSETvQ"
Date: Fri, 19 Aug 2016 14:53:26 GMT
Connection: keep-alive

It Works!!
```

[node-js-download]: http://nodejs.org/download/
[docker]: http://docker.io
