# Setup package name variables
NAME := mosaic-generator-docker
PKG := github.com/ch3ck/$(NAME)
PREFIX?=$(shell pwd)
BUILDTAGS=
version=v1.1 

.PHONY: clean build-docker-image run-docker help
.DEFAULT: default

#--- Help ---
help:
	@echo 
	@echo Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build-docker-image:
	@echo "+ $@"
	docker build . -t chrisbward/mosaic-generator

run-docker:
	@echo "+ $@"
	docker run -v $(shell pwd)/source_images/:/usr/src/app/source_images/ -v $(shell pwd)/output/:/usr/src/app/output/ chrisbward/mosaic-generator
 
clean:
	@echo "+ $@" 