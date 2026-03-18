FROM php:8.3-apache

COPY index.php /var/www/html/index.php

RUN apt-get update
RUN apt-get install nano
