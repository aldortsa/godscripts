#!/bin/sh
WEBROOT="/var/www/"
if [ "$2" = "laravel" ]; then
	CREDENTIALS="$WEBROOT$1/project/public/credentials.txt"
	PASSWORD="$(echo -n "$1"hangar | md5sum | awk '{print $1}' )"
	if [ ! -f "$WEBROOT$1/project/public/.htpasswd" ]; then
		htpasswd -cb "$WEBROOT$1/project/public/.htpasswd" "$1" "$PASSWORD"
		touch "$CREDENTIALS"
		echo "USERNAME: $1" >> "$CREDENTIALS"
		echo "PASSWORD: $PASSWORD" >> "$CREDENTIALS"
	fi
	echo "SITE USERNAME: $1"
	echo "SITE PASSWORD: $PASSWORD"
else
	CREDENTIALS="$WEBROOT$1/project/credentials.txt"
	PASSWORD="$(echo -n "$1"hangar | md5sum | awk '{print $1}' )"
	if [ ! -f "$WEBROOT$1/project/.htpasswd" ]; then
		htpasswd -cb "$WEBROOT$1/project/.htpasswd" "$1" "$PASSWORD"
		touch "$CREDENTIALS"
		echo "USERNAME: $1" >> "$CREDENTIALS"
		echo "PASSWORD: $PASSWORD" >> "$CREDENTIALS"
	fi
	echo "SITE USERNAME: $1"
	echo "SITE PASSWORD: $PASSWORD"

fi

