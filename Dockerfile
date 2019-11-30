FROM alpine:3.9

RUN apk add libjpeg-turbo-utils

WORKDIR /tmp/images
