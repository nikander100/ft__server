# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: nvan-der <nvan-der@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/25 15:28:25 by nvan-der       #+#    #+#                 #
#    Updated: 2020/03/11 17:02:56 by nvan-der      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y

# Install nginx, wget, mariadb(MySQL), openssl, php 
RUN apt-get install -y nginx mariadb-server php7.3 php-mysql php-fpm php-cli php-mbstring wget

# Copy files
COPY ./srcs/start_server.sh /var/
COPY ./srcs/auto-index.sh /var/
COPY ./srcs/mysql_setup.sql /var/
COPY ./srcs/wordpress.sql /var/
COPY ./srcs/wordpress.tar.gz /var/www/html/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
COPY ./srcs/php.ini /etc/php/7.3/fpm/
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

# Install/Setup phpmyadmin
WORKDIR /var/www/html
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin
COPY ./srcs/config.inc.php phpmyadmin

# Install/Setup Wordpress
RUN tar xf ./wordpress.tar.gz && rm -f wordpress.tar.gz
RUN chmod 755 -R wordpress/

# Setup Server
RUN service mysql start && mysql -u root mysql < /var/mysql_setup.sql && mysql wordpress -u root --password= < /var/wordpress.sql
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/C=NL/ST=NH/L=Amsterdam/O=42/CN=nvan-der' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt
RUN chown -R www-data:www-data *
RUN chmod 775 -R *

# Start Server
CMD bash /var/start_server.sh

EXPOSE 80 433
