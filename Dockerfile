# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: nvan-der <nvan-der@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/25 15:28:25 by nvan-der       #+#    #+#                 #
#    Updated: 2020/02/28 17:00:05 by nvan-der      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN app-get update
RUN app-get upgrade -y

#Install nginx, wget, mariadb(MySQL), php

RUN app-get install -y nginx
RUN app-get install -y wget
RUN app-get install -y mariadb-server
RUN app-get install -y php7.3 php-fpm php-MySQL

#copy files

COPY /srcs/start_server.sh /var/start_server.sh

#Start Server

CMD bash /var/start_server.sh

EXPOSE 80