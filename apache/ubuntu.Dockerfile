ARG base_version=latest
FROM ajitemsahasrabuddhe/ubuntu-base:${base_version}

ARG env=dev
ARG php_version

# Install PHP / Apache / Composer
RUN add-apt-repository ppa:ondrej/php \
    && add-apt-repository ppa:ondrej/apache2 \
    && apt-get update \
    && apt-get install -y \
    php${php_version} \
    php${php_version}-bcmath \
    php${php_version}-bz2 \
    php${php_version}-cli \
    php${php_version}-common \
    php${php_version}-curl \
    php${php_version}-gd \
    php${php_version}-json \
    php${php_version}-mbstring \
    php${php_version}-mysql \ 
    php${php_version}-opcache \
    php${php_version}-xml \
    php${php_version}-zip \
    libapache2-mod-php${php_version} \
    apache2 \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# optional install xdebug
RUN if [ "$env" = "dev" ] ; then apt-get install -y php${php_version}-xdebug; fi

# cleanup
RUN rm -r /var/lib/apt/lists/*

COPY scripts/apache2-entrypoint /usr/local/bin/entrypoint
COPY scripts/apache2-foreground /usr/local/bin/
COPY conf/apache-supervisord.conf /etc/supervisor/supervisord.conf
COPY www/* /var/www/html/

RUN { \
		echo '<FilesMatch \.php$>'; \
		echo '\tSetHandler application/x-httpd-php'; \
		echo '</FilesMatch>'; \
		echo; \
		echo 'DirectoryIndex disabled'; \
		echo 'DirectoryIndex index.php index.html'; \
		echo; \
		echo '<Directory /var/www/>'; \
		echo '\tOptions -Indexes'; \
		echo '\tAllowOverride All'; \
		echo '</Directory>'; \
	} | tee "/etc/apache2/conf-available/docker-php.conf" \
	&& a2enconf docker-php \
    && a2enmod rewrite

#setcap to bind to privileged ports as non-root
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/apache2

    #Take Owneship
RUN chown -hR www-data:www-data /var/www \
    && chown -hR www-data:www-data /var/log \
    && chown -hR www-data:www-data /var/run \
    && chown -hR www-data:www-data /run \
    # Add root user to www-data group so curl as root can write logs
    && usermod -aG www-data root \
    #Output logs to std
    && ln -sfT /dev/stderr /var/log/apache2/error.log \
	&& ln -sfT /dev/stdout /var/log/apache2/access.log \
	&& ln -sfT /dev/stdout /var/log/apache2/other_vhosts_access.log \
    #Find all files in the given path and apply permissions 664 to them
    && find /var/www/html -type f -exec chmod 664 {} \; \
    #Find all directories in the given path and apply permissions 775 to them
    && find /var/www/html -type d -exec chmod 775 {} \; \
    #Set the group id on the directory so that the files created in this directory in the future are automatically owned by the group
    && find /var/www/html -type d -exec chmod g+s {} \;

HEALTHCHECK --interval=60s --timeout=30s CMD nc -zv localhost 80 || exit 1

EXPOSE 80

ENTRYPOINT [ "entrypoint" ]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

USER www-data

WORKDIR /var/www/html