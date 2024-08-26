FROM debian:experimental-20240722

RUN apt-get update && \
  apt-get install -yq ssh && \
  apt-get -t experimental install -yq reprepro

EXPOSE 22
WORKDIR /workdir
ENTRYPOINT ["/bin/reprepro"]
CMD ["-h"]

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
