FROM debian:bullseye

ARG ftp_user
ARG ftp_password

RUN apt-get update \
	&& apt-get install -y \
		vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN useradd -m $ftp_user \
	&& yes $ftp_password | passwd $ftp_user

RUN echo $ftp_user | tee -a /etc/vsftpd.userlist

RUN mkdir -p /var/run/vsftpd
EXPOSE 21

ENTRYPOINT ["vsftpd", "/etc/vsftpd.conf"]
