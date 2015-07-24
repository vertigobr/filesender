#!/bin/sh
docker run --name postgres -d \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=vertigo \
    registry.vtg/postgres:latest
