# Use debian as base image for our Docker image.
# bullseye = debian 11
FROM debian:bullseye

ARG domain_name

# Install nginx on the container.
RUN apt-get update && \
	apt-get install -y nginx

# Copy Nginx configuration file to Docker image's filesystem.
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# Replaces "[DOMAIN_NAME]" by the value of $domain_name variable in nginx.conf .
RUN sed -i "s/\[DOMAIN_NAME\]/$domain_name/" /etc/nginx/conf.d/nginx.conf

# Install openssl on the container.
RUN apt-get install openssl

# Create a new self-signed certificate & key and set them to read-only.
RUN openssl req -new \
		-newkey rsa:4096 -x509 -sha256 \
		-days 365 \
		-nodes \
		-subj "/C=FR/ST=Ile-de-France/L=Paris/O=42/CN=ple-stra/emailAddress=ple-stra@student.42.fr" \
		-out /etc/nginx/tsl_certificate.pem \
		-keyout /etc/nginx/tsl_certificate_key.pem \
	&& chmod 400 \
		/etc/nginx/tsl_certificate.pem \
		/etc/nginx/tsl_certificate_key.pem

# Informs Docker that the container listens on the port 443.
# This only serves as documentation for the end-user or Docker (or can be used
# with `-P` flag).
EXPOSE 443

# Launch Nginx as foreground service on the container, so Nginx won't stop
# until it register an error or the container is stopped. 
CMD [ "nginx", "-g", "daemon off;" ]
