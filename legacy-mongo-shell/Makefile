default: build-local

build-init:
	docker buildx create --driver=docker-container --name=ferretdb-deps

build-local:
	docker buildx build --builder=ferretdb-deps \
		--tag=legacy-mongo-shell-local \
		--load .

build-push:
	test -n $(DOCKER_TAG)
	docker buildx build --builder=ferretdb-deps \
		--platform=linux/arm64,linux/amd64 \
		--tag=ghcr.io/ferretdb/legacy-mongo-shell:$(DOCKER_TAG) \
		--push .
