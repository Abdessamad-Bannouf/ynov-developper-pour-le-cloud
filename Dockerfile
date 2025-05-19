FROM php:8.2-fpm

# Installer dépendances système
RUN apt-get update && apt-get install -y \
    git unzip libpq-dev zip curl libzip-dev libonig-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html