#!/bin/bash
docker build -t my-backend-with-tools .
docker stop backend-with-tools || true
docker rm backend-with-tools || true
docker run -d --name backend-with-tools -p 8080:8080 my-backend-with-tools


chmod +x build_and_run.sh
./build_and_run.sh
