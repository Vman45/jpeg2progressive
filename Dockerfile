FROM alpine:3.9

RUN apk add libjpeg-turbo-utils bash imagemagick && \
    mkdir -p /tmp/images/results/convert && \
    mkdir -p /tmp/images/results/jpegtran

WORKDIR /tmp/images
