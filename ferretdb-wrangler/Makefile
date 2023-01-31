update:
	rm -fr node_modules package-lock.json
	/opt/homebrew/opt/node@18/bin/node /opt/homebrew/opt/node@18/bin/npm install --save --save-exact

build-init:
	docker buildx create --driver=docker-container --name=ferretdb

build-local:
	rm -fr node_modules
	docker buildx build --builder=ferretdb \
		--tag=ferretdb-wrangler-local \
		--load .

build-push:
	rm -fr node_modules
	test -n $(DOCKER_TAG)
	docker buildx build --builder=ferretdb \
		--platform=linux/arm64,linux/amd64 \
		--tag=ghcr.io/ferretdb/ferretdb-wrangler:$(DOCKER_TAG) \
		--push .
