FROM golang:1.20.0

RUN go install -v std
RUN go install -v -trimpath std

# ignore "-race is not supported on linux/arm"
RUN go install -v -race std; exit 0
RUN go install -v -trimpath -race std; exit 0

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
