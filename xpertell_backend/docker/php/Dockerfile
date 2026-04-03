FROM 545006460792.dkr.ecr.eu-central-1.amazonaws.com/base:php-v8.2.19-amd64

ARG NOVA_LICENSE_KEY
ARG NOVA_EMAIL

WORKDIR /var/www/

COPY ../../. /var/www

RUN composer config http-basic.nova.laravel.com $NOVA_EMAIL $NOVA_LICENSE_KEY

RUN composer install --optimize-autoloader $COMPOSER_NO_DEV_FLAG

RUN php artisan octane:install --server=swoole

COPY ../../config/my-octane.php /var/www/config/octane.php

COPY /docker/php/supervisor.conf /etc/supervisor/conf.d/xpertell.conf

EXPOSE 8000

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

#CMD ["php", "artisan", "octane:start", "--server=swoole", "--host=0.0.0.0", "--port=8000"]