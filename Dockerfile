FROM php:8.2-fpm
MAINTAINER Mischa Braam "mischa.braam@iodigital.com"

RUN apt-get -yq update
RUN apt-get -yq upgrade

# Install dependencies
RUN apt-get install -y \
    unzip \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt-dev \
    libxml2-dev \
    git-core \
    libzip-dev \
    curl \
    build-essential \
    sendmail-bin \
    sendmail \
    sudo \
    software-properties-common \
    libsodium-dev \
    rsync \
    gpg \
    apt-transport-https ca-certificates


# Install required PHP extensions
RUN docker-php-ext-install dom
RUN docker-php-ext-install intl
# RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-install soap
RUN docker-php-ext-install sockets
RUN docker-php-ext-install sodium
RUN docker-php-ext-install bcmath

RUN pecl install -f libsodium


# Configure the gd library
# RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd


# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.6.6
