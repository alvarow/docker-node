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

clean:  stop
	rm -rf node_modules
	docker rm docker-node
	docker rmi alvarow/docker-node

#commit:
#	docker commit -m "First version" -a "Alvaro Reguly" docker-node alvaroww/docker-node:v1.0

.PHONY: install build run run-container test logs stop clean commit
