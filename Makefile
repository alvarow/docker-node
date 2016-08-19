install:
	npm install

build:
	docker build -t alvaro/docker-node .

run:
	npm start

run-container:
	docker run -p 8080:8080 -d alvaro/docker-node

test:
	curl -i http://localhost:8080/alvaro?hello=world

clean:
	rm -rf node_modules


.PHONY: install build run test clean
