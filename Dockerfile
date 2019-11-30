FROM alpine:3.9

RUN apk add libjpeg-turbo-utils bash imagemagick

WORKDIR /tmp/images
