#!/bin/sh

if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "Installing WordPress on container..."
	mv wordpress/* /var/www/html/
	echo "Done."
fi
rm -rf wordpress

cd /var/www/html
/usr/sbin/php-fpm7.4 -F
