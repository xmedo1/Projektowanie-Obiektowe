#!/usr/bin/bash

echo -e "Uruchamiam aplikacje\n"
echo -e "Logowanie (eager): http://localhost:8080/login?user=admin&pass=password\n"
echo -e "Logowanie (lazy): http://localhost:8080/login?user=admin&pass=password\n"

docker build -t zadanie03-obiektowe .
docker run --rm -p 8080:8080 zadanie03-obiektowe