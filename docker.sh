#/bin/bash

x=$RANDOM
y=$RANDOM
docker run -itd --name webserver$x -p $y:80 -v my_second_volume:/var/www/html aamirs/webserver_final_version:v1.0
elinks http://172.17.0.17:$y/webapp/target/index.jsp
