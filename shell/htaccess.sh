#!/bin/sh
WEBROOT="/var/www/"
if [ "$2" = "laravel" ]; then
	if [ ! -f "$WEBROOT$1/project/public/.htaccess" ]; then
		touch "$WEBROOT$1/project/public/.htaccess"
	fi
		echo "$WEBROOT$1/project/public/.htaccess"
		echo "AuthType Basic" > "$WEBROOT$1/project/public/.htaccess"
		echo "AuthName \"restricted area\"" >> "$WEBROOT$1/project/public/.htaccess"
		echo "AuthUserFile $WEBROOT$1/project/public/.htpasswd" >> "$WEBROOT$1/project/public/.htaccess"
		echo "require valid-user" >> "$WEBROOT$1/project/public/.htaccess"
		echo "<IfModule mod_rewrite.c>" >> "$WEBROOT$1/project/public/.htaccess"
		echo "<IfModule mod_negotiation.c>" >> "$WEBROOT$1/project/public/.htaccess" 
		echo "Options -MultiViews" >> "$WEBROOT$1/project/public/.htaccess"
		echo "</IfModule>" >> "$WEBROOT$1/project/public/.htaccess"
		echo "RewriteEngine On" >> "$WEBROOT$1/project/public/.htaccess"
		echo "RewriteRule ^(.*)/$ /$1 [L,R=301]" >> "$WEBROOT$1/project/public/.htaccess"
		echo "RewriteCond %{REQUEST_FILENAME} !-d" >> "$WEBROOT$1/project/public/.htaccess"
		echo "RewriteCond %{REQUEST_FILENAME} !-f" >> "$WEBROOT$1/project/public/.htaccess"
		echo "RewriteRule ^ index.php [L]" >> "$WEBROOT$1/project/public/.htaccess"
		echo "</IfModule>" >> "$WEBROOT$1/project/public/.htaccess"
		echo "HTACCESS FILE CREATED"

elif [ "$2" = "wordpress" ] then
	if [ ! -f "$WEBROOT$1/project/.htaccess" ]; then
		touch "$WEBROOT$1/project/.htaccess"
	fi
		echo "$WEBROOT$1/project/.htaccess"
		echo "AuthType Basic" > "$WEBROOT$1/project/.htaccess"
		echo "AuthName \"restricted area\"" >> "$WEBROOT$1/project/.htaccess"
		echo "AuthUserFile $WEBROOT$1/project/.htpasswd" >> "$WEBROOT$1/project/.htaccess"
		echo "require valid-user" >> "$WEBROOT$1/project/.htaccess"
		echo "<IfModule mod_rewrite.c>" >> "$WEBROOT$1/project/.htaccess"
		echo "RewriteEngine On" >> "$WEBROOT$1/project/.htaccess"
		echo "RewriteBase /" >> "$WEBROOT$1/project/.htaccess"
		echo "RewriteRule ^index\.php$ - [L]" >> "$WEBROOT$1/project/.htaccess"
		echo "RewriteCond %{REQUEST_FILENAME} !-f" >> "$WEBROOT$1/project/.htaccess"
		echo "RewriteCond %{REQUEST_FILENAME} !-d" >> "$WEBROOT$1/project/.htaccess"
		echo "RewriteRule . /index.php [L]" >> "$WEBROOT$1/project/.htaccess"
		echo "</IfModule>" >> "$WEBROOT$1/project/.htaccess"

		echo "php_value upload_max_filesize 100M" >> "$WEBROOT$1/project/.htaccess"
		echo "php_value post_max_size 100M" >> "$WEBROOT$1/project/.htaccess"
		echo "HTACCESS FILE CREATED"
else
	if [ ! -f "$WEBROOT$1/project/.htaccess" ]; then
		touch "$WEBROOT$1/project/.htaccess"
	fi
		echo "$WEBROOT$1/project/.htaccess"
		echo "AuthType Basic" > "$WEBROOT$1/project/.htaccess"
		echo "AuthName \"restricted area\"" >> "$WEBROOT$1/project/.htaccess"
		echo "AuthUserFile $WEBROOT$1/project/.htpasswd" >> "$WEBROOT$1/project/.htaccess"
		echo "require valid-user" >> "$WEBROOT$1/project/.htaccess"
		echo "HTACCESS FILE CREATED"
	
fi
