#/bin/bash

nohup java -jar target/dependency/webapp-runner.jar target/*.war  --port 9090 >/dev/null 2>&1 & 