FROM debian:experimental-20240722

ENV REPREPRO_BASE_DIR=/srv/repos/apt/debian

RUN mkdir -p /var/inputs
RUN mkdir -p $REPREPRO_BASE_DIR

COPY apt $REPREPRO_BASE_DIR/conf

RUN apt-get update && \
  apt-get install -yq ssh && \
  apt-get -t experimental install -yq reprepro

EXPOSE 22
ENTRYPOINT ["/bin/reprepro"]
CMD ["-h"]
