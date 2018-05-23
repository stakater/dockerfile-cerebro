.PHONY: help

.DEFAULT_GOAL := help

TAG ?= 0.7.3
PREFIX ?= stakater

SHELL := /bin/bash

help: # http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: container

container:
	sh build.sh

push:
	docker push $(PREFIX)/cerebro:$(TAG)