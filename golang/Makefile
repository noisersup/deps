default: build-local

build-init:
	docker buildx create --driver=docker-container --name=ferretdb

build-local:
	docker buildx build --builder=ferretdb \
		--tag=golang-local \
		--load .

build-push:
	test -n $(DOCKER_TAG)
	docker buildx build --builder=ferretdb \
		--platform=linux/arm/v6,linux/arm/v7,linux/arm64,linux/amd64 \
		--tag=ghcr.io/ferretdb/golang:$(DOCKER_TAG) \
		--push .
