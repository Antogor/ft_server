CREATE DATABASE wordpress;
CREATE USER 'root@localhost' identified by '';
GRANT ALL PRIVILEGES ON wordpress.* TO 'root@localhost';
FLUSH PRIVILEGES;
