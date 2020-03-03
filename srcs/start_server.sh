# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    start_server.sh                                    :+:    :+:             #
#                                                      +:+                     #
#    By: nvan-der <nvan-der@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/28 16:14:08 by nvan-der       #+#    #+#                 #
#    Updated: 2020/03/03 17:55:18 by nvan-der      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

service php7.3-fpm start
service nginx start
service mysql start

while true;
	do sleep 10000;
done