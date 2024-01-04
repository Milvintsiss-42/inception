FROM debian:bullseye

ARG PHP_VERSION="7.4"
ARG WORDPRESS_VERSION="6.4.2"
ARG WORDPRESS_ARCHIVE="wordpress-$WORDPRESS_VERSION-fr_FR.tar.gz"
RUN apt-get update \
	&& apt-get install -y \
		wget \
		php$PHP_VERSION-fpm

COPY ./conf/php-fpm/www.conf /etc/php/$PHP_VERSION/fpm/pool.d/
# Create a directory to host php sock-file
# See https://stackoverflow.com/questions/29859131/unable-to-bind-listening-socket-for-address-php-fpm
RUN mkdir -p /run/php

RUN wget https://fr.wordpress.org/$WORDPRESS_ARCHIVE \
	&& tar xf $WORDPRESS_ARCHIVE \
	&& rm -rf $WORDPRESS_ARCHIVE
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./tools/install_and_launch_wordpress.sh .
RUN chmod u+x install_and_launch_wordpress.sh
CMD [ "./install_and_launch_wordpress.sh" ]
