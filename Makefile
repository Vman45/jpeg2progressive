rm:
	docker rm test

build:
	docker build . -t jpeg_progressive

create:
	docker create -v .:/tmp/images" jpeg_progressive

run: create
	docker run jpeg_progressive jpegtran -h

list:
	docker run jpeg_progressive ls /opt/images
