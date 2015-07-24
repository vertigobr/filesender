#!/bin/sh
docker run --rm -ti \
    --link postgres:postgres \
    registry.vtg/postgres:latest sh -c 'exec psql -h "postgres" -p "5432" -U postgres'
