#!/bin/bash
_cerebro_version=$1
_cerebro_tag=$2
_release_build=false

if [ -z "${_cerebro_version}" ]; then
	source CEREBRO_VERSION
	_cerebro_version=$CEREBRO_VERSION
	_cerebro_tag=$CEREBRO_VERSION
	_release_build=true
fi

echo "CEREBRO_VERSION: ${_cerebro_version}"
echo "DOCKER TAG: ${_cerebro_tag}"
echo "RELEASE BUILD: ${_release_build}"

docker build --build-arg CEREBRO_VERSION=${_cerebro_version} --tag "stakater/cerebro:${_cerebro_tag}"  --no-cache=true .

if [ $_release_build == true ]; then
	docker build --build-arg CEREBRO_VERSION=${_cerebro_version} --tag "stakater/cerebro:latest"  --no-cache=true .
fi