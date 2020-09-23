FROM debian:buster

MAINTAINER Antonio Garzon Iniesta

ENV AUTOINDEX="on"

RUN apt-get -y update && apt-get -y upgrade && \
	apt-get install -y nginx php-fpm php-mysql \
	php-mbstring mariadb-server openssl && wget && \
	wget https://es.wordpress.org/wordpress-latest-es_ES.tar.gz && \
	tar -xzvf wordpress-latest-es_ES.tar.gz && \
	rm -f wordpress-latest-es_ES.tar.gz && \
	rm -f wordpress/wp-config-sample.php && \
	mv -f wordpress /var/www/html/ && \
	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz && \
	tar -xzvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
   	rm -f phpMyAdmin-5.0.2-all-languages.tar.gz && \
	mv -f phpMyAdmin-5.0.2-all-languages /var/www/html/phpMyAdmin && \
	rm -f phpMyAdmin/config.sample.inc.php


COPY srcs/php/wp-config.php /var/www/html/wordpress/
COPY srcs/php/config.inc.php /var/www/html/phpMyAdmin/
COPY srcs/nginx_conf/nginx /etc/nginx/sites-available/
COPY srcs/nginx_conf/nginx /tmp
COPY srcs/nginx_conf/nginx_auto_off /tmp
COPY srcs/nginx_conf/change_autoindex.sh /

COPY srcs/index/index.html /var/www/html
COPY srcs/index/futurama.jpg /var/www/html

COPY srcs/sql/init.sql /tmp/
COPY srcs/sql/wordpress.sql /tmp/

RUN	rm -rf /etc/nginx/sites-available/default && \
	rm -f /var/www/html/index.nginx-debian.html && \
	rm -rf /etc/nginx/sites-enabled/default && \
	ln -sf /etc/nginx/sites-available/nginx /etc/nginx/sites-enabled/ && \
	chown -R www-data:www-data /var/www/html/wordpress && \
	chmod -R 755 /var/www/* && \
	service mysql start && \
	mysql -u root --password= < /tmp/init.sql && \
	mysql wordpress -u root --password= < /tmp/wordpress.sql && \
	chmod 700 /etc/ssl/private && \
	openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" \
	-keyout /etc/ssl/private/agarzon.key \
	-out /etc/ssl/certs/agarzon.crt && \
	openssl dhparam -out /etc/nginx/dhparam.pem 1000

EXPOSE 80 443

CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	bash
