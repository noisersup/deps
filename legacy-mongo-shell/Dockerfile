# sync tag with git clone's argument below
FROM mongo:7.0.0 AS build

RUN apt update
RUN apt install -y \
    git \
    python3-pip \
    libssl-dev \
    liblzma-dev \
    libcurl4-openssl-dev

WORKDIR /mongo

# sync tag with image tag above
RUN git clone -b r7.0.0 --depth 1 --progress https://github.com/mongodb/mongo.git .

RUN python3 -m pip install -r etc/pip/compile-requirements.txt

# If you get "g++: fatal error: Killed signal terminated program cc1plus" or a similar error,
# increase the amount of memory available to Docker,
# or add `-j1` parameter to build sequentially.
RUN python3 buildscripts/scons.py install-mongo --linker=gold --disable-warnings-as-errors

FROM mongo:7.0.0

COPY --from=build /mongo/build/install/bin/mongo /usr/bin
RUN ln -sv /usr/bin/mongo /mongo

WORKDIR /
CMD []
ENTRYPOINT ["mongo"]

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/FerretDB/deps"
