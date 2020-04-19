# Docker PhpHBB

* TODO: fix permissions
* Maybe don't use bitnami

## Set up

* Create `.env` with the following content:


	```bash
	# MariaDB root user
	MYSQL_ROOT_PASSWORD=

	# MariaDB PHP user
	MYSQL_PASSWORD=
	MYSQL_USER=u_phpbb
	MYSQL_DATABASE=phpbb

	# PHP settings
	PHPBB_PASSWORD=my_password
	```

* Create `./data/mariadb` with the contents of `/var/lib/mariadb`
* `docker-compose up --build`
