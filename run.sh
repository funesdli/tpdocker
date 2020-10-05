
#!/bin/bash

#image en argument de la commande bash run.sh
image=$1
echo -e "\nImage : $image\n"

#image en cours
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

#run image
docker run -d -p 80:80 -v /test/web:/var/www/localhost/htdocs $image

#mysql phpmyadmin
docker run --name tp-mysql -e MYSQL_ROOT_PASSWORD=tpdocker -e MYSQL_DATABASE=db-wordpress -d mysql:8.0
docker run --name tp-phpmydamin -d --link tp-mysql:db -p 8081:80 phpmyadmin/phpmyadmin

#ip
echo -e '\n'
hostname -I | awk '{print $2}'
echo -e "port : 80\n"
