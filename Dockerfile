FROM php:7.3-apache

# Update and start
RUN apt-get update && apt-get install -y --no-install-recommends \
  autoconf \
  build-essential \
  apt-utils \
  zlib1g-dev \
  libzip-dev \
  unzip \
  zip \
  libmagick++-dev \
  libmagickwand-dev \
  libpq-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libwebp-dev \ 
  libxpm-dev 

# GD lib
RUN docker-php-ext-configure gd \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-xpm-dir \
    --with-freetype-dir
RUN docker-php-ext-install gd

# Zip
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip

# intl lib
RUN docker-php-ext-install intl

# PDO lib
RUN docker-php-ext-install pdo_mysql pdo_pgsql mysqli

#Imagick
RUN pecl install imagick-3.4.3
RUN docker-php-ext-enable imagick

# xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install composer via curl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clear package lists
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Permissions
RUN chown -R root:www-data /var/www/html
RUN chmod u+rwx,g+rx,o+rx /var/www/html
RUN find /var/www/html -type d -exec chmod u+rwx,g+rx,o+rx {} +
RUN find /var/www/html -type f -exec chmod u+rw,g+rw,o+r {} +

# Set workdir
WORKDIR /var/www/html

# Enable mods
RUN a2enmod rewrite
RUN a2enmod ssl

# Expose ports
EXPOSE 80
EXPOSE 443
