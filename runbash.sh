#!/bin/sh
ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
#echo "ENVBASH=$ENVBASH"
docker run --rm -ti \
   -p 8000:80 \
   -p 8443:443 \
   -e SERVERPORT="192.168.59.103:8443" \
   --link postgres:postgres \
   vertigo/filesender:latest $ENVBASH ${@:2}
