rm:
	docker rmi -f jpeg_progressive

build:
	docker build . -t jpeg_progressive

create: build
	docker create jpeg_progressive

progressive: create
	docker run -v "$(shell pwd)":/tmp/images -u $(shell id -u ${USER}):$(shell id -g ${USER}) jpeg_progressive ./progressive.sh
