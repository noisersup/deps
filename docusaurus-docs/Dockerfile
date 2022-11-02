FROM node:16.17.1-alpine3.16

WORKDIR /workdir/docusaurus-docs
COPY *.json .
RUN npm ci

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"

ENTRYPOINT ["/workdir/docusaurus-docs/node_modules/.bin/docusaurus"]
CMD ["-h"]
