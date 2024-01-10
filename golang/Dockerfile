FROM golang:1.21.6

ARG TARGETVARIANT

RUN <<EOF
set -ex

apt update
apt install -y rsync time

# https://github.com/docker-library/golang/issues/494
export GOARM=${TARGETVARIANT#v}

# ingore "unsupported GOOS/GOARCH pair" for arm/v6 and arm/v7
time env GOOS=windows go install -v std || true
time env GOOS=darwin  go install -v std || true

time env CGO_ENABLED=0 go install -v std
time env CGO_ENABLED=1 go install -v std

# ignore "-race is not supported on linux/arm"
time env CGO_ENABLED=1 go install -v -race std || true

EOF

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
