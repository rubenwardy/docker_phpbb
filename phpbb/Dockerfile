FROM php:7.2-apache

# Do a dist-upgrade and install the required packages:
RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y \
		libpng-dev libjpeg-dev imagemagick jq git-core wget unzip && \
	# Install required PHP extensions:
	docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ && \
	docker-php-ext-install gd  mysqli && \
	# Uninstall obsolete packages:
	apt-get autoremove -y libpng-dev libjpeg-dev && \
	# Remove obsolete files:
	apt-get clean


# Enable the Apache Rewrite module:
RUN ln -s /etc/apache2/mods-available/rewrite.load \
  /etc/apache2/mods-enabled/rewrite.load

# Enable the Apache Headers module:
RUN ln -s /etc/apache2/mods-available/headers.load \
  /etc/apache2/mods-enabled/headers.load

# Add a custom Apache config:
COPY apache.conf /etc/apache2/conf-enabled/custom.conf

# Add the PHP config file:
COPY php.ini /usr/local/etc/php/

COPY entrypoint.sh /entrypoint.sh

# Install phpBB into the Apache document root:
RUN cd /var/www && \
	wget https://download.phpbb.com/pub/release/3.3/3.3.0/phpBB-3.3.0.zip && \
	unzip phpBB-3.3.0.zip && \
	rm php*.zip
RUN rm -rf \
		/var/www/phpBB3/install \
		/var/www/phpBB3/docs \
		/var/www/html && \
	mv /var/www/phpBB3 /var/www/html

# Install phpBB into the Apache document root:
# RUN rm -rf /var/www/html
# RUN git clone --depth 1 https://github.com/phpbb/phpbb -b release-3.3.0 /var/www/html
# RUN rm -rf \
#     /var/www/html/install \
#     /var/www/html/docs

# Add the phpBB config file:
COPY config.php /var/www/html/

# Expose the phpBB upload directories as volumes:
VOLUME \
  /var/www/html/files \
  /var/www/html/store \
  /var/www/html/images/avatars/upload

CMD ["/entrypoint.sh"]
