FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install php php-fpm php-mysql curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php

WORKDIR	/var/www/wordpress/

COPY ./tools/wp_cli_install.sh /usr/local/bin/wp_cli_install.sh

RUN chmod +x /usr/local/bin/wp_cli_install.sh 

EXPOSE 8010

ENTRYPOINT ["/usr/local/bin/wp_cli_install.sh"]


 
