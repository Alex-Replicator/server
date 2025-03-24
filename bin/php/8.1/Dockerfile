FROM php:8.1-fpm

# Установка зависимостей и расширений PHP
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    libicu-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libonig-dev \
    zip \
    unzip \
    curl \
    wget \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql mysqli zip intl opcache exif mbstring xml curl \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Настройка расширений memcached
RUN apt-get update && apt-get install -y libmemcached-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached

# Копирование PHP конфигурации
COPY config/php/php.ini /usr/local/etc/php/conf.d/custom.ini
COPY config/php/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf

# Установка рабочей директории
WORKDIR /var/www/html

# Настройка пользователя
RUN usermod -u 1000 www-data

# Создание директории для логов
RUN mkdir -p /var/log/php-fpm && \
    chown -R www-data:www-data /var/log/php-fpm

# Открытие порта для PHP-FPM
EXPOSE 9000

# Запуск PHP-FPM
CMD ["php-fpm"] 