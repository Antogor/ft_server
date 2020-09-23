#!/bin/bash

## Download the latest version from wordpress
#echo -e "\e[32m Downloading latest version from wordpress... \e[0m"
#
#if wget https://es.wordpress.org/wordpress-latest-es_ES.tar.gz > history.log 2>error.log; then
#	echo -e "\e[32m Latest version from wrodpress loaded\n \e[0m"
#else
#	echo -e "\e[91m Error download wordpress\n \e[0m"
#	exit 1
#fi
#
### Config wordpress before Docker
#echo -e "\e[32m Coping wordpress.config... \e[0m"
#
#if tar -xzvf wordpress-latest-es_ES.tar.gz>> history.log 2>>error.log; then
#	rm -f wordpress-latest-es_ES.tar.gz>> history.log 2>>error.log
#	rm -f wordpress/wp-config-sample.php >>history.log 2>>error.log
#	cp -f php/wp-config.php wordpress/>> history.log 2>>error.log
#	echo -e "\e[32m Wordpress.config copied\n \e[0m"
#else
#	echo -e "\e[91m Error to copy wrodpress.config\n \e[0m"
#	exit 1
#fi
#
### Download the latest version from phpMyAdmin
#echo -e "\e[35m Downloading phpMyAdmin... \e[0m"
#
#if wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz>> history.log 2>>error.log; then
#	echo -e "\e[35m phpMyAdmin downloaded\n \e[0m"
#else
#	echo -e "\e[91m Error download phpMyAdmin\n \e[0m"
#	exit 1
#fi
#
### Configure phpMyAdmin
#echo -e "\e[35m Configuring phpMyAdmin...\e[0m"
#if tar -xzvf phpMyAdmin-5.0.2-all-languages.tar.gz>> history.log 2>>error.log; then
#	rm -f phpMyAdmin-5.0.2-all-languages.tar.gz>> history.log 2>>error.log
#	mv -f phpMyAdmin-5.0.2-all-languages phpMyAdmin >> history.log 2>>error.log
#	rm -f phpMyAdmin/config.sample.inc.php>> history.log 2>>error.log
#	cp -f php/config.inc.php phpMyAdmin/>> history.log 2>>error.log
#	echo -e "\e[35m Php configured\n \e[0m"
#else
#	echo -e "\e[91m Error to configure php\n \e[0m"
#	exit 1
#fi

## Starting Ft_server
echo -e "\e[34m Building Docker image...\e[0m"

## Conditional to build the image, if not possible the script stop
if docker build ../ -t ft_server:latest>> history.log 2>>error.log; then
	echo -e "\e[34m Docker image builded, name of container: ft_server\n \e[0m"
else
	echo -e "\e[91m Docker image couldn't was buildt\n \e[0m"
	exit 1
fi

## Starting container
echo -e "\e[34m Loading container ft_server...\e[0m"

## Run the container, if not possible the script stop
docker run --name ft_server --rm -p 80:80 -p 443:443 -it ft_server:latest
#if docker run --name ft_server --rm -p 80:80 -p 443:443 -it ft_server:latest; then
	#echo -e "\e[34m Container loaded and runing\n \e[0m"
#else
#	echo -e "\e[91m Docker container couldn't was loaded\n \e[0m"
#	exit 1
#fi

