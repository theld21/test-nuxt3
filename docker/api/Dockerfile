FROM php:8.2-fpm-alpine
WORKDIR /

RUN apk update && apk add \
  git \
  wget \
  freetype \
  freetype-dev \
  libpng-dev \
  jpeg-dev \
  libzip-dev \
  zip \
  unzip \
  openssh \
  autoconf \
  supervisor \
  libreoffice \
  ghostscript

# RUN  docker-php-ext-configure gd \
#         --with-freetype-dir=/usr/bin/ \
#         --with-png-dir=/usr/bin/ \
#         --with-jpeg-dir=/usr/lib/ \
#         --with-gd

# RUN docker-php-ext-install gd opcache pdo_mysql && \
#   docker-php-ext-configure zip --with-libzip && \
#   docker-php-ext-install zip  && \
#   docker-php-ext-install sockets

ENV PHPREDIS_VERSION 5.3.7

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./php.ini /usr/local/etc/php/conf.d/php.ini

ARG DOCKER_UID
ARG DOCKER_GID
RUN if [ ${DOCKER_UID:-0} -ne 0 ] && [ ${DOCKER_GID:-0} -ne 0 ]; then \
    deluser www-data &&\
    if getent group www-data ; then delgroup www-data; fi &&\
    addgroup -g ${DOCKER_GID} www-data &&\
    adduser -u ${DOCKER_UID} -G www-data www-data --disabled-password &&\
    install -d -m 0755 -o www-data -g www-data /home/www-data \
;fi

RUN apk add --no-cache openssl

COPY --from=composer:2.5.8 /usr/bin/composer /usr/bin/composer

COPY ./laravelschedule.ini /etc/supervisor.d/laravelschedule.ini
RUN touch /worker.log

COPY ./crontab.txt /crontab.txt
RUN /usr/bin/crontab -u www-data /crontab.txt

WORKDIR /app