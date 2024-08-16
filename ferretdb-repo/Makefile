build-init:
	docker buildx create --driver=docker-container --name=ferretdb-deps

build-local:
	docker buildx build --builder=ferretdb-deps \
		--tag=ferretdb-reprepro \
		--load . && \
