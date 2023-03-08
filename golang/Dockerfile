FROM golang:1.20.2

RUN env CGO_ENABLED=0 go install -v std
RUN env CGO_ENABLED=0 go install -v -trimpath std

RUN env CGO_ENABLED=1 go install -v std
RUN env CGO_ENABLED=1 go install -v -trimpath std

# ignore "-race is not supported on linux/arm"
RUN env CGO_ENABLED=1 go install -v -race std; exit 0
RUN env CGO_ENABLED=1 go install -v -trimpath -race std; exit 0

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
