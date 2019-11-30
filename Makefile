rm:
	docker rm test

build:
	docker build . -t jpeg_progressive

create:
	docker create -v .:/tmp/images jpeg_progressive

run: create
	docker run jpeg_progressive jpegtran -h

list:
	docker run jpeg_progressive ls /opt/images

aa:
	docker run -v "$(shell pwd)":/tmp/images -u $(shell id -u ${USER}):$(shell id -g ${USER}) jpeg_progressive ./convert.sh
