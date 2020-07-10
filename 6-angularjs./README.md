# Simple AngularJS Hello World Web Application


This is a very simple AngularJS web application made up of two modules; angular-hello-world-service and angular-hello-world-ui.

The Docker Compose file deploys the service module as a web application to Tomcat and the UI files to a NGINX instance that also serves as a reverse proxy to Tomcat for REST requests.


## Run from source

To run this stack from source:

```
$ git clone <repo-name>
$ cd angular-hello-world
$ mvn package
$ docker-compose -f docker-compose-dev.yml up
```

## Run from binaries

To run this stack from the prebuilt Docker images from Docker Hub:

```
$ cd angular-hello-world
$ docker-compose up -d
```

View the app at http://localhost:8080/
