#!/bin/sh
docker run --name filesender -di \
   -p 8000:80 \
   -p 8443:443 \
   -e SERVERPORT="192.168.59.103:8443" \
   --link postgres:postgres \
   registry.vtg/vertigo/filesender:latest
