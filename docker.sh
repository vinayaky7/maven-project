#/bin/bash

x=$RANDOM
y=$RANDOM
docker build -t testing_mywebserver:v1.0 .
docker images
docker run -itd --name webserver$x -p $y:80 -v my_second_volume:/var/www/html testing_mywebserver:v1.0
