#!/bin/bash

RELEASE=11

DIRS="hmi plc simulation"
DIRS="hmi simulation"

docker login --username=dainok

# Build images
for i in ${DIRS}; do
	cd ${i}
	docker build --no-cache -t dainok/virtuaplant-${i}:latest -t dainok/grficsv2-${i}:${RELEASE} .
	docker push dainok/grficsv2-${i}:${RELEASE}
	docker push dainok/grficsv2-${i}:latest
	cd ..
done
