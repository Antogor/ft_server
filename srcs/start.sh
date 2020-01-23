#PREPARACION
apt-get update
apt-get upgrade -y

#INSTALACION
apt-get -y install mariadb-server
apt-get -y install php-mysql
apt-get -y install nginx

#CREACION DE CARPETAS
mkdir var/www/wordpress var/www/phpmyadmin