FROM ajitemsahasrabuddhe/debian-base:1.0

ARG env=dev
ARG php_version

# Install PHP-FPM / nginx / Composer
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
    && apt-get update \
    && apt-get install -y \
    php${php_version} \
    php${php_version}-bcmath \
    php${php_version}-bz2 \
    php${php_version}-cli \
    php${php_version}-common \
    php${php_version}-curl \
    php${php_version}-fpm \
    php${php_version}-gd \
    php${php_version}-json \
    php${php_version}-mbstring \
    php${php_version}-mysql \ 
    php${php_version}-opcache \
    php${php_version}-xml \
    php${php_version}-zip \
    nginx \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# optional install xdebug
RUN if [ "$env" = "dev" ] ; then apt-get install -y php${php_version}-xdebug; fi

# cleanup
RUN rm -r /var/lib/apt/lists/*

COPY scripts/apache2-entrypoint /usr/local/bin/entrypoint
COPY scripts/apache2-foreground /usr/local/bin/
COPY conf/nginx-supervisord.conf /etc/supervisor/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/fpm-pool.conf /etc/php/${php_version}/fpm/pool.d/www.conf
COPY www/* /var/www/html/

#setcap to bind to privileged ports as non-root
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/nginx
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/php-fpm${php_version}

    #Take Owneship
RUN chown -hR www-data:www-data /var/www \
    && chown -hR www-data:www-data /var/log \
    && chown -hR www-data:www-data /var/run \
    && chown -hR www-data:www-data /var/lib \
    # Make directory for php-fpm socket and take ownership
    && mkdir -p /run/php \
    && chown -hR www-data:www-data /run \
    # Add root user to www-data group so curl as root can write logs
    && usermod -aG www-data root \
    #Output logs to std
    && ln -sfT /dev/stderr /var/log/nginx/error.log \
	&& ln -sfT /dev/stdout /var/log/nginx/access.log \
	&& ln -sfT /dev/stdout /var/log/nginx/other_vhosts_access.log \
    #Find all files in the given path and apply permissions 664 to them
    && find /var/www/html -type f -exec chmod 664 {} \; \
    #Find all directories in the given path and apply permissions 775 to them
    && find /var/www/html -type d -exec chmod 775 {} \; \
    #Set the group id on the directory so that the files created in this directory in the future are automatically owned by the group
    && find /var/www/html -type d -exec chmod g+s {} \; \
    && mv /var/www/html/index.nginx-debian.html index.html \
    && ln -s /usr/sbin/php-fpm${php_version} /usr/sbin/php-fpm

HEALTHCHECK --interval=60s --timeout=30s CMD nc -zv localhost 80 || exit 1

USER www-data

EXPOSE 80

ENTRYPOINT [ "entrypoint" ]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]