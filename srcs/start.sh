#PREPARACION
sudo apt-get update
sudo apt-get upgrade -y

#INSTALACION
sudo apt-get -y install nginx && \
#sudo apt-get -y install mariadb-server && \
sudo apt-get -y install mysql-server && \
sudo apt-get -y install php7.2-cli php7.2-fpm php7.2-mysql php7.2-json php7.2-opcache php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl && \
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