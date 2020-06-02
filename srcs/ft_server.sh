#!/bin/bash
#
## Download the latest version from wordpress
#echo "Downloading latest version from wordpress"
#
#if wget https://wordpress.org/latest.tar.gz; then
#	echo "Latest version from wrodpress loaded"
#else
#	echo "Error download wordpress"
#	exit 1
#fi
#
## Config wordpress before Docker
#echo "Coping wordpress.config"
#
#if tar -zxvf latest.tar.gz; rm latest.tar.gz; cp wp-config.php wordpress/; then
#	echo "Wordpress.config copied"
#else
#	echo "Error to copy wrodpress.config"
#	exit 1
#fi
#
## Download the latest version from phpMyAdmin
#echo "Downloading phpMyAdmin"
#
#if wget https://phpmyadmin.net/phpMyAdmin-5.0.2-all-languages.tar.gz; then
#	echo "phpMyAdmin downloaded"
#else
#	echo "Error download phpMyAdmin"
#	exit 1
#fi
#
## Configure phpMyAdmin
#if tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz; rm phpMyAdmin-5.0.2-all-languages.tar.gz; cp config.inc.php phpMyAdmin; then
#	echo "Php configured"
#else
#	echo "Error to configure php"
#	exit 1
#fi
#

# Starting Ft_server
echo Building Docker image...

# Conditional to build the image, if not possible the script stop
if docker build ../ -t ft_server; then
	echo Docker image builded, name of container: ft_server
else
	echo "Docker image couldn't was buildt"
	exit 1
fi

# Starting container
echo Loading container ft_server...

# Conditional to run the container, if not possible the script stop
if docker run -p 80:80 -p 443:443 -td ft_server; then
	echo Container loaded and runing
else
	echo "Docker container couldn't was loaded"
	exit 1
fi

