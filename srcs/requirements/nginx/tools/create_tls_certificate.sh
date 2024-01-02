#/bin/bash

C="FR"
ST="Ile-de-France"
L="Paris"
O="42"
CN="ple-stra"
EMAIL_ADRESS="ple-stra@student.42.fr"

mkdir -p /etc/nginx/tls
# Create a new self-signed certificate & key and set them to read-only.
openssl req -new \
		-newkey rsa:4096 -x509 -sha256 \
		-days 365 \
		-nodes \
		-subj "/C=$C/ST=$ST/L=$L/O=$O/CN=$CN/emailAddress=$EMAIL_ADRESS" \
		-out /etc/nginx/tls/tls_certificate.pem \
		-keyout /etc/nginx/tls/tls_certificate_key.pem \
	&& chmod 400 \
		/etc/nginx/tls/tls_certificate.pem \
		/etc/nginx/tls/tls_certificate_key.pem
