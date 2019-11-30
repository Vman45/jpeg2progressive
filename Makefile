PWD = $(shell pwd)
UID = $(shell id -u ${USER})
GID = $(shell id -g ${USER})
IMAGE_NAME = jpeg_progressive

rm:
	docker rmi -f ${IMAGE_NAME}

build:
	docker build . -t ${IMAGE_NAME}

create: build
	docker create ${IMAGE_NAME}

progressive:
	docker run -v "${PWD}":/tmp/images -u "${UID}":"${GID}" "${IMAGE_NAME}" ./progressive.sh

minify:
	docker run -v "${PWD}":/tmp/images -u "${UID}":"${GID}" "${IMAGE_NAME}" ./minify.sh
