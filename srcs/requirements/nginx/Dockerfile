# Use debian as base image for our Docker image.
# bullseye = debian 11
FROM debian:bullseye

ARG domain_name

# Install nginx and openssl on the container.
RUN apt-get update \
	&& apt-get install -y \
		nginx \
		openssl

# Copy Nginx configuration file to Docker image's filesystem.
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# Replaces "[DOMAIN_NAME]" by the value of $domain_name variable in nginx.conf .
RUN sed -i "s/\[DOMAIN_NAME\]/$domain_name/" /etc/nginx/conf.d/nginx.conf

# Create a new self-signed certificate & key.
COPY ./tools/create_tls_certificate.sh .
RUN bash ./create_tls_certificate.sh

# Informs Docker that the container listens on the port 443.
# This only serves as documentation for the end-user or Docker (or can be used
# with `-P` flag).
EXPOSE 443

# Launch Nginx as foreground service on the container, so Nginx won't stop
# until it register an error or the container is stopped.
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
