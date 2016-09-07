install:
	npm install

build:
	docker build -t alvarow/docker-node:latest .

run:
	npm start

run-container:
	docker run -p 3000:3000 -d --name docker-node alvarow/docker-node

test:
	curl -i http://localhost:3000/alvarow?hello=world

logs:
	docker logs docker-node -f

stop:
	docker stop docker-node
	docker inspect -f '{{.State.ExitCode}}' docker-node
	docker rm docker-node

clean:  stop
	rm -rf node_modules
	docker rmi alvarow/docker-node

pull:
	docker pull alvarow/docker-node

commit:
	docker commit -m "First version" -a "Alvaro Reguly" docker-node alvarow/docker-node:v1.0

push:
	docker push alvarow/docker-node:latest

.PHONY: install build run run-container test logs stop clean pull commit push
