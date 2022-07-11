FROM php:7.4-fpm

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt-get update && apt-get install -y \
    libgmp-dev \
    libuv1-dev \
    gnupg \
    wget \
    && wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/multiarch-support_2.27-3ubuntu1.5_amd64.deb\
    && apt-get install ./multiarch-support_2.27-3ubuntu1.5_amd64.deb \
    && chmod +x /usr/local/bin/install-php-extensions \
    && sync \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools unixodbc-dev openssl unzip git \
    && sed -i -E 's/(CipherString\s*=\s*DEFAULT@SECLEVEL=)2/\11/' /etc/ssl/openssl.cnf \
    && echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc \
    && install-php-extensions \
        @composer-2 \
        mbstring \
        gd \
        memcached \
        memcache \
        intl \
        igbinary \
        pgsql \
        bcmath \
        opcache \
        xml \
        geoip \
        mcrypt \
        redis \
        sodium \
        ds \
        rdkafka \
        soap \
        pdo_sqlsrv \
        sqlsrv \
        gmagick \
        sockets \
        zip \
        bz2 \
        xsl \
        pdo_pgsql \
        pdo_mysql \
        exif \
        msgpack \
        calendar \
        decimal \
        gettext \
        pcntl \
        shmop \
        sysvmsg \
        sysvsem \
        sysvshm \
        && docker-php-source extract \
        && curl -L -o /tmp/psr-php.tar.gz "https://github.com/jbboehr/php-psr/archive/refs/tags/v1.0.1.tar.gz" \
        && mkdir /tmp/psr-php \
        && tar xfz /tmp/psr-php.tar.gz --strip 1 -C /tmp/psr-php \
        && rm -r /tmp/psr-php.tar.gz \
        && mv /tmp/psr-php/ /usr/src/php/ext/psr-php \
        && rm -rf /tmp/psr-php \

        && curl -L -o /tmp/phalcon4.tar.gz "https://github.com/phalcon/cphalcon/archive/refs/tags/v4.1.2.tar.gz" \
        && mkdir /tmp/phalcon4 \
        && tar xfz /tmp/phalcon4.tar.gz --strip 1 -C /tmp/phalcon4 \
        && rm -r /tmp/phalcon4.tar.gz \
        && mv /tmp/phalcon4/ext /usr/src/php/ext/phalcon4 \
        && rm -rf /tmp/phalcon4 \

        && docker-php-ext-install psr-php phalcon4 \
        && apt-get clean
