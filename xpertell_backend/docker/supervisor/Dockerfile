FROM php:8.2.19-cli

ARG DEBIAN_FRONTEND

WORKDIR /var/www/

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    supervisor \
    libonig-dev \
    libpng-dev \
    libjpeg-dev \
    curl \
    zip \
    git \
    unzip \
    && docker-php-ext-install zip pdo_mysql pcntl bcmath exif mbstring \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd

RUN pecl channel-update pecl.php.net \
    && pecl install redis \
    && docker-php-ext-enable redis

COPY ./supervisor.conf /etc/supervisor/conf.d/xpertell.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
