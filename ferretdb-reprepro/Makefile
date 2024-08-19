build-init:
	docker buildx create --driver=docker-container --name=ferretdb-deps

build-local:
	docker buildx build --builder=ferretdb-deps \
		--tag=ferretdb-reprepro-local \
		--load .

build-push:
	rm -fr node_modules
	test -n $(DOCKER_TAG)
	docker buildx build --builder=ferretdb-deps \
		--platform=linux/arm64,linux/amd64 \
		--tag=ghcr.io/ferretdb/ferretdb-reprepro:$(DOCKER_TAG) \
		--push .
