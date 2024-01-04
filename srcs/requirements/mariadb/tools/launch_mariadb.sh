#!/bin/sh
sed -i "s/\$MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/" /etc/init_mariadb.sql
sed -i "s/\$MYSQL_USER/$MYSQL_USER/" /etc/init_mariadb.sql
sed -i "s/\$MYSQL_PASSWORD/$MYSQL_PASSWORD/" /etc/init_mariadb.sql

exec mariadbd \
	--no-defaults \
	--user=root \
	--datadir=/var/lib/mysql \
	--init-file=/etc/init_mariadb.sql
