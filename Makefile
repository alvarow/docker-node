install:
	npm install

build:
	docker build -t alvaro/docker-node:latest .

run:
	npm start

run-container:
	docker run -p 3000:3000 -d --name docker-node alvaro/docker-node

test:
	curl -i http://localhost:3000/alvaro?hello=world

logs:
	docker logs docker-node -f

clean:
	rm -rf node_modules
	docker stop docker-node
	docker inspect -f '{{.State.ExitCode}}' docker-node
	docker rm docker-node
	docker rmi alvaro/docker-node

#commit:
#	docker commit -m "First version" -a "Alvaro Reguly" docker-node alvarow/docker-node:v1.0

.PHONY: install build run test clean
