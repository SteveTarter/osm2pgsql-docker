FROM alpine:3.15
  
MAINTAINER Steve Tarter <steve@tarter.net>

# Version of osm2pgsql to use.
ARG OSM2PGSQL_VERSION 1.5.1

# Add dependencies needed for osm2pgsql.
RUN apk --no-cache update && \
    apk --no-cache add g++ make cmake openssl && \
    apk --no-cache add expat-dev bzip2-dev zlib-dev boost-dev postgresql-dev lua-dev proj-dev

# retrieve osm2pgsql and build it.

RUN wget https://github.com/openstreetmap/osm2pgsql/archive/${OSM2PGSQL_VERSION}.tar.gz && \
    tar xzvf ${OSM2PGSQL_VERSION}.tar.gz && \
    cd /osm2pgsql-${OSM2PGSQL_VERSION} && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && make install

# clean up the source, and packages needed just to build.
RUN cd / && \
    rm -r /osm2pgsql-${OSM2PGSQL_VERSION} && \
    apk del expat-dev bzip2-dev zlib-dev boost-dev g++ make openssl proj-dev

# add these packages which are used at runtime.
RUN apk --no-cache update && \
    apk --no-cache add boost proj
