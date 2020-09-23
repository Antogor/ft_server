#!/bin/bash

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
