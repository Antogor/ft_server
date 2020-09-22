#!/bin/bash

if [ "$(echo $AUTOINDEX)" == "on" ]; then
	cp /tmp/nginx_auto_off /etc/nginx/sites-available/nginx
	export AUTOINDEX="off"
else
	cp /tmp/nginx /etc/nginx/sites-available/nginx
	export AUTOINDEX="on"
fi

service nginx reload
