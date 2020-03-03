# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: nvan-der <nvan-der@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/25 15:28:25 by nvan-der       #+#    #+#                 #
#    Updated: 2020/03/03 15:17:32 by nvan-der      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y

# Install nginx, wget, mariadb(MySQL), openssl, php 

RUN apt-get install -y nginx wget mariadb-server openssl php7.3 php-fpm php-mysql

# Copy files

COPY /srcs/start_server.sh /var/start_server.sh

# Setup Server

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# Start Server

CMD bash /var/start_server.sh

EXPOSE 80
