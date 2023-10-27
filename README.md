# Overview

This is an attempt at getting ChatGPT 4 to build a Spring Boot application
using SQLite for a database and PrimeVue for a simple web interface.  I wasn't
able to get this fully working, this is well outside my wheelhouse (I haven't
programmed any Java for 15 years, and I've never touched Vue before).

## Building

docker build -t reapp . --progress plain
docker run -p 8080:8080 reapp
