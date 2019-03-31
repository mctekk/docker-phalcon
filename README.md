# docker-phalcon
Centos 7.x , PHP-FPM with PhalconPHP and all the neccesary libs to work with our baka packages 

# running it
To run you development enviorment you just need to run

`docker-compose up --build`

# getting you container information
if you know a little bit about docker , you know that in oder to get the info you need to run

`docker container list`

or

`docker-compose ps`

# how do I get into any of the container ssh or mysql?
you will need to run the following command

`docker-compose exec -it {container name} sh`

example

`docker-compose exec -it mysql mysql -u root -p`

`docker-compose exec -it baka sh`
