#!/bin/sh
export PGPASSWORD=vertigo
export PGUSER=postgres
createuser -w -h postgres -S -D -R filesender
psql -h postgres < /opt/alter.sql
createdb -h postgres -E UTF8 -O filesender filesender
psql -h postgres filesender filesender < /usr/share/filesender/scripts/filesender_db.sql

