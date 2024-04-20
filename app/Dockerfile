FROM php:7.4-apache

RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip 

RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN a2enmod rewrite && service apache2 restart && chown -R www-data:www-data /var/www

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd zip

COPY . /var/www/html/

WORKDIR /var/www/html/

EXPOSE 80


CMD ["apache2-foreground"]
