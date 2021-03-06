#!/bin/sh
WEBROOT="/var/www/"
VHOSTDIR="/etc/apache2/sites-available/"
EXTENSION=".conf"
RESTARTCMD="/usr/bin/sudo service apache2 reload"
if [ "$1" != '' ]; then
    if [ ! -f "$VHOSTDIR$1.conf" ]; then
        if [ "$2" = "laravel" ]; then
            cp "$VHOSTDIR/skeleton_laravel" "$VHOSTDIR$1$EXTENSION"
        else
            cp "$VHOSTDIR/skeleton" "$VHOSTDIR$1$EXTENSION"
        fi
        echo "created $VHOSTDIR$1$EXTENSION"
    else
        mv "$VHOSTDIR$1.conf" "$VHOSTDIR$1$EXTENSION.bak"
        cp "$VHOSTDIR/skeleton" "$VHOSTDIR$1$EXTENSION"
        echo "created $VHOSTDIR$1$EXTENSION and made a backup of the existing conf"
    fi
    find "$VHOSTDIR$1$EXTENSION" -type f -exec sed -i "s/SKELETON/$1/" {} \;
    if [ ! -d "$WEBROOT$1/" ]; then
        mkdir "$WEBROOT$1/"
        chown -R www-data "$WEBROOT$1/"
        echo "created $WEBROOT$1/"
    else
        echo "$WEBROOT$1/ already exists"
    fi
    sudo a2ensite $1
    $RESTARTCMD
    echo "reloaded apache"
fi