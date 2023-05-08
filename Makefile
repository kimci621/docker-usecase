build:
	docker build -t test_image .
run:
	docker run -d -p 3000:3000 --name TEST_CONTAINER test_image
run-dev:
	docker run -p 3000:3000 -d --rm --name TEST_CONTAINER -v data:/app/data -v /app/node_modules -v "C:/Users/Amir/Desktop/docker-test/node-logger/logs-app:/app" test_image
delete: 
	docker rmi test_image
start:
	docker start TEST_CONTAINER
stop:
	docker stop TEST_CONTAINER
attach:
	docker attach TEST_CONTAINER
logs:
	docker logs TEST_CONTAINER
remove: 
	docker rm TEST_CONTAINER
list-c: 
	docker ps
list-ca:
	docker ps -a
list-i:
	docker images