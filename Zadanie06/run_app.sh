#!/usr/bin/bash
docker build -t zadanie06-obiektowe .
docker run -it --rm -p 8080:8080 -p 5173:5173 zadanie06-obiektowe