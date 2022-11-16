FROM node:18.12.1-alpine3.16

WORKDIR /workdir/docusaurus-docs
COPY *.json .
RUN npm ci

ENTRYPOINT ["/workdir/docusaurus-docs/node_modules/.bin/docusaurus"]
CMD ["-h"]

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
