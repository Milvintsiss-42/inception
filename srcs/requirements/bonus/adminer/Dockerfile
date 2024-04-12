FROM debian:bullseye

ARG PHP_VERSION="7.4"
ARG ADMINER_VERSION="4.8.1"

RUN apt-get update \
	&& apt-get install -y \
		wget \
		php${PHP_VERSION}-fpm \
		php${PHP_VERSION}-mysql

RUN mkdir -p /var/www/html/adminer \
	&& cd /var/www/html/adminer \
	&& wget https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php \
	&& mv adminer-${ADMINER_VERSION}.php adminer.php

COPY ./conf/php-fpm/www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/

EXPOSE 9000

RUN mkdir -p /run/php
ENTRYPOINT [ "/usr/sbin/php-fpm7.4", "-F" ]
