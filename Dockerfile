# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: nvan-der <nvan-der@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/25 15:28:25 by nvan-der       #+#    #+#                 #
#    Updated: 2020/02/28 17:47:09 by nvan-der      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y

#Install nginx, wget, mariadb(MySQL), php

RUN apt-get install -y nginx
RUN apt-get install -y wget
RUN apt-get install -y mariadb-server
RUN apt-get install -y php7.3 php-fpm php-mysql

#copy files

COPY /srcs/start_server.sh /var/start_server.sh

#Start Server

CMD bash /var/start_server.sh

EXPOSE 80