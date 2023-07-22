#/bin/bash

nohup java -jar target/dependenscy/webapp-runner.jar target/*.war  --port 9999 & >  test.log 2>&1 &