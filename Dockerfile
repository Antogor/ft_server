FROM debian:buster

#PREPARACION
RUN  apt-get update
RUN  apt-get upgrade -y
RUN apt-get install wget -y

#INSTALACION
RUN  apt-get -y install nginx && \
	 apt-get -y install mariadb-server mariadb-client && \
	 apt-get -y install default-mysql-server && \
	 apt-get -y install php-fpm php-mysql && \
#	 apt-get -y install phpmyadmin && \
	 wget https://es.wordpress.org/wordpress-latest-es_ES.tar.gz && \
	 tar -xf wordpress-latest-es_ES.tar.gz && \
	 rm wordpress-latest-es_ES.tar.gz

#CONFIGURAR ARCHIVOS
#COPY ./srcs/wordpress /var/www/html/
COPY ./srcs/phpMyAdmin /var/www/html/
COPY ./srcs/create_database.sql /tmp/
COPY ./srcs/default /etc/nginx/sites-available/

RUN chown -R www-data: /var/www/* && chmod -R 755 /var/www/*

#INICIAR SERVICIOS
RUN service mysql -u root

CMD bash
