# Usa PHP 8.2 si 8.3 falla
FROM php:8.3-fpm

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    git \
    unzip \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Instalar Composer correctamente
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

# Establecer directorio de trabajo
WORKDIR /var/www

# Copiar los archivos del proyecto
COPY . .

# Dar permisos a Laravel
RUN chmod -R 777 storage bootstrap/cache

# Instalar dependencias con Composer
RUN /usr/local/bin/composer install --no-dev --optimize-autoloader

# Exponer el puerto de PHP-FPM
EXPOSE 9000

# Comando para iniciar el servidor
CMD ["php-fpm"]
