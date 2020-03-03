CREATE DATABASE wordpress;

CREATE DATABASE phpmyadmin;

GRANT ALL PRIVILEGES ON wordpress.* to 'root'@'localhost';

GRANT ALL PRIVILEGES ON phpmyadmin.* to 'root'@'localhost';

FLUSH PRIVILEGES;

UPDATE mysql.user set plugin = 'mysql_native_password' where user='root';
