# Docker PhpHBB

* Maybe don't use bitnami

## Set up

* Create `.env` with the following content:

	```bash
	MYSQL_PASSWORD=
	MYSQL_ROOT_PASSWORD=
	MYSQL_USER=u_phpbb
	MYSQL_DATABASE=phpbb

	# PhpBB config
	PHPBB_PASSWORD=
	PHPBB_FORUM_NAME=Minetest Forums
	PHPBB_FORUM_DESCRIPTION=Description
	PHPBB_EMAIL=user@example.com
	TABLE_PREFIX=phpbb_
	PHPBB_INSTALLED=true
	AUTO_DB_MIGRATE=false

	# Apache
	SERVER_NAME=localhost
	```

* Create `./data/mariadb` with the contents of `/var/lib/mariadb`.
* Create `./data/phpbb` with `files`, `store`, and `avatars`.
* `docker-compose up --build`
