# Usar una imagen base de PHP (Cambia a PHP 8.2 si 8.3 da problemas)
FROM php:8.2-fpm

# Instalar dependencias necesarias
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

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Establecer directorio de trabajo
WORKDIR /var/www

# Copiar los archivos del proyecto
COPY . .

# Establecer permisos para Laravel
RUN chmod -R 777 storage bootstrap/cache

# Instalar dependencias con Composer
RUN composer install --no-dev --optimize-autoloader

# Exponer el puerto que usa PHP-FPM
EXPOSE 9000

# Comando por defecto para ejecutar PHP-FPM
CMD ["php-fpm"]
