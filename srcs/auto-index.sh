if [ "$1" = "on" ]; then
	sed -i 33's/\boff/on/' /etc/nginx/sites-available/localhost && \
	nginx -s reload
elif [ "$1" = "off" ]; then
	sed -i 33's/\bon/off/' /etc/nginx/sites-available/localhost && \
	nginx -s reload
fi