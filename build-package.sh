#!/bin/sh

RECIPE=$1

docker build -t debianbuilder .
docker run -it -v ${PWD}/./${RECIPE}:/data debianbuilder /bin/bash -c "cd /data ; fpm-cook clean ; fpm-cook"
