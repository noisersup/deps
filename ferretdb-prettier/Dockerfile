FROM node:20.12.1-alpine3.18

WORKDIR /deps
COPY *.json .
RUN npm ci

WORKDIR /workdir
ENTRYPOINT ["/deps/node_modules/.bin/prettier"]
CMD ["-h"]

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
