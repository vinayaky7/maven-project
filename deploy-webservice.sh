#/bin/bash

nohup java -jar target/dependency/webapp-runner.jar target/*.war  --port 9999 </dev/null >/dev/null 2>&1 &