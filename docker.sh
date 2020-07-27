#/bin/bash

x=$RANDOM
y=$RANDOM
echo "$x"
docker run -itd --name webserver$x -p $y:80 -v my_second_volume:/var/www/html aamirs/webserver_final_version:v1.0
