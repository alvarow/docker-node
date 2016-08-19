install:
	npm install

build:
	docker build -t alvaro/docker-node .

run:
	npm start

run-container:
	docker run -p 8080:8080 -d --name docker-node alvaro/docker-node

test:
	curl -i http://localhost:8080/alvaro?hello=world

clean:
	rm -rf node_modules
	docker stop docker-node
	docker rm docker-node


.PHONY: install build run test clean
