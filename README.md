# osm2pgsql-docker

A simple docker container that runs osm2pgsql, borrowing from other Docker recipes for this.  The build.sh script builds the Docker image.  It contains the environment variable, OSM2PGSQL_VERSION, which can be used to select other versions of osm2pgsql.  The default value for the version is 1.5.1.

# Work in progress

This container is a part of a Kubernetes system to display map information with NASA's Wordwind.  Integration of this component has just begun; further details with how to use will be posted shortly.
