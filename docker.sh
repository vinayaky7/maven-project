#/bin/bash

x=$RANDOM
y=$RANDOM
docker run -itd --name webserver$x -p $y:80 -v my_second_volume:/var/www/html aamirs/webserver_final_version:v1.0
elinks http://18.191.141.223:$y/webapp/target/index.jsp
