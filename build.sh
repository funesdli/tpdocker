
#!/bin/bash

#dockerfile passé en argument : bash build.sh dockerfile
echo -e "\nnom dockerfile : $1\n"

#build
docker build -t css/$1 - < $1
docker pull mysql/mysql-server
echo -e "\nnom de l'image : css/$1\n"

mkdir /srv/wordpress
mkdir /srv/wordpress/db
mkdir /srv/wordpress/statics
