#!/bin/bash

RELEASE=19

DIRS="hmi plc simulation workstation"

docker login --username=dainok

# Build images
for i in ${DIRS}; do
	cd ${i}
	docker build --no-cache -t dainok/grficsv2-${i}:latest -t dainok/grficsv2-${i}:${RELEASE} .
	docker push dainok/grficsv2-${i}:${RELEASE}
	docker push dainok/grficsv2-${i}:latest
	cd ..
done
