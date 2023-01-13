FROM node:18.13.0-alpine3.16

# for wrangler to be able to pick up branch name, commit hash, etc.
RUN apk --no-cache add git

WORKDIR /deps
COPY *.json .
RUN npm ci

WORKDIR /workdir
ENTRYPOINT ["/deps/node_modules/.bin/wrangler"]
CMD ["-h"]

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
