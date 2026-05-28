#!/usr/bin/bash
docker build -t zadanie05-obiektowe .
docker run -d -p 8080:8080 -p 5173:5173 zadanie05-obiektowe

.venv/bin/python main.py