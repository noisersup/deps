FROM node:18.12.1-alpine3.16

WORKDIR /deps
COPY *.json .
RUN npm ci

WORKDIR /workdir
ENTRYPOINT ["/deps/node_modules/.bin/textlint"]
CMD ["-h"]

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
