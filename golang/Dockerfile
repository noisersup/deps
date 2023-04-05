# syntax=docker/dockerfile:1

FROM golang:1.20.3

RUN <<EOF
set -ex

env CGO_ENABLED=0 go install -v std

env CGO_ENABLED=1 go install -v std

# ignore "-race is not supported on linux/arm"
env CGO_ENABLED=1 go install -v -race std || true

apt update
apt install -y rsync
EOF

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
