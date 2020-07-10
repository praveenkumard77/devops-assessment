# Simple NodeJS Hello World Web Application

This repo contains the code for building a hello world nodejs application.

## Pre-requisites
Since the applciations are already running and we need to dockerise the application, We will need the package.json. I have included a test package.json file

## Build Docker image

docker build -t web


## Build using docker-compose

docker-compose up --build


index.js has been created with simple HTTP server that will serve on port 8080
