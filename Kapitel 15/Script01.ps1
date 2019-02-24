docker volume create mysql_data

docker network create wordpress

docker container run -d --name mysql -e MYSQL_ROOT_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress --network wordpress -v wordpress_data:/var/lib/mysql mysql:5.7

docker container run -e WORDPRESS_DB_HOST=db:3306 -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress --link mysql:mysql --network wordpress -p 80:80 wordpress:latest