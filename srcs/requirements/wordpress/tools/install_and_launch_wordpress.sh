#!/bin/sh

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
if [ ! -f "wp-config.php" ]; then
	echo "Installing WordPress on container..."

	mv /wordpress/* .

	wp config create --dbname='wordpress' --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost='mariadb:3306' --allow-root
	wp core install --url="$DOMAIN_NAME" --title="Macarena" --admin_user="$WP_ADMIN_USERNAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root
	wp user create "$WP_BASIC_USER_USERNAME" "$WP_BASIC_USER_EMAIL" --user_pass="$WP_BASIC_USER_PASSWORD" --allow-root

	# Redis cache
	wp config set WP_REDIS_HOST redis --allow-root
	wp plugin install --activate redis-cache --allow-root
	wp redis enable --allow-root

	echo "Done."
fi
rm -rf /wordpress

/usr/sbin/php-fpm7.4 -F
