FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y \
		mariadb-server

RUN mkdir -p /run/mysqld

EXPOSE 3306

COPY ./tools/init_mariadb.sql /etc/init_mariadb.sql
COPY ./tools/launch_mariadb.sh .
RUN chmod u+x launch_mariadb.sh
CMD [ "./launch_mariadb.sh" ]