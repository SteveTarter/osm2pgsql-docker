#!/bin/bash

# Choose version to use
OSM2PGSQL_VERSION=1.5.1

# Create timestamp to add to Docker image
BUILD_TIMESTAMP=$(date +%Y%m%dT%H%M%S)

docker build --build-arg OSM2PGSQL_VERSION=${OSM2PGSQL_VERSION} -t stevetarter/osm2pgsql:${OSM2PGSQL_VERSION}-${BUILD_TIMESTAMP} .

docker tag stevetarter/osm2pgsql:${OSM2PGSQL_VERSION}-${BUILD_TIMESTAMP} stevetarter/osm2pgsql:latest

docker push stevetarter/osm2pgsql:${OSM2PGSQL_VERSION}-${BUILD_TIMESTAMP} 
docker push stevetarter/osm2pgsql:latest

