#PREPARACION
sudo apt-get update
sudo apt-get upgrade -y

#INSTALACION
sudo apt-get -y install nginx && \
sudo apt-get -y install mariadb-server && \
sudo apt-get -y install mysql-server && \
sudo apt-get -y install php-mysql && \
sudo wget https://es.wordpress.org/wordpress-latest-es_ES.tar.gz && \
tar -xf wordpress-latest-es_ES.tar.gz && \
rm wordpress-latest-es_ES.tar.gz

#CONFIGURAR ARCHIVOS
sudo cp -r ./wordpress /var/www/html/
sudo cp -r ./phpMyAdmin /var/www/html/
sudo cp ./create_database.sql /tmp/
sudo chown -R www-data: /var/www/* && sudo chmod -R 755 /var/www/*
sudo cp ./default /etc/nginx/sites-available/

#INICIAR SERVICIOS
service mysql -u root --password < /tmp/create_database.sql && \
service mysql wordpress -u root --pasword=""
