#!/bin/bash
export DBHOST=${DBHOST:-"postgres"}
export DBPORT=${DBPORT:-"5432"}
export DBPASSWORD=${DBPASSWORD:-"vertigo"}
export ADMINEMAIL=${ADMINEMAIL:-"teste@vertigo.com.br"}
export TIMEZONE=${TIMEZONE:-"America/Sao_Paulo"}
export SERVERPORT=${SERVERPORT:-"localhost:8443"}

echo "Environment dump:"
echo "-----------------"
env
echo "-----------------"

envsubst '$DBHOST$DBPORT$DBPASSWORD$ADMINEMAIL$TIMEZONE$SERVERPORT' < /opt/config.php > /usr/share/filesender/config/config.php

echo "Checking DB (ignore errors)..."
su - postgres -c 'sh /opt/createdb.sh'
echo "End of DB check."

echo "Fixing fileserver.conf"


#openssl req \
#    -new \
#    -newkey rsa:4096 \
#    -days 365 \
#    -nodes \
#    -x509 \
#    -subj "/C=BR/ST=RJ/L=Niteroi/O=Vertigo/CN=localdocker.vtg" \
#    -keyout /opt/localdocker.vtg.key \
#    -out /opt/localdocker.vtg.cert

echo "Starting Apache/PHP..."
exec /usr/sbin/apachectl -D FOREGROUND

