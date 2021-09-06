FROM php:7.4-fpm

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt-get update && apt-get install -y \
    unzip \
    git \
    libgmp-dev \
    multiarch-support \
    libuv1-dev \
    gnupg \
    && chmod +x /usr/local/bin/install-php-extensions \
    && sync \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools unixodbc-dev openssl \
    && sed -i -E 's/(CipherString\s*=\s*DEFAULT@SECLEVEL=)2/\11/' /etc/ssl/openssl.cnf \
    && echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc \
    && install-php-extensions \
        @composer-2.0.2 \
        mbstring \
        gd \
        memcached \
        memcache \
        intl \
        igbinary \
        mongodb \
        swoole \
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
        && curl -L -o /tmp/cassandra-cpp-driver.deb "https://downloads.datastax.com/cpp-driver/ubuntu/18.04/cassandra/v2.15.2/cassandra-cpp-driver_2.15.2-1_amd64.deb" \
        && curl -L -o /tmp/cassandra-cpp-driver-dev.deb "https://downloads.datastax.com/cpp-driver/ubuntu/18.04/cassandra/v2.15.2/cassandra-cpp-driver-dev_2.15.2-1_amd64.deb" \
        && dpkg -i /tmp/cassandra-cpp-driver.deb \
        && dpkg -i /tmp/cassandra-cpp-driver-dev.deb \
        && rm -f /tmp/cassandra-cpp-driver.deb \
        && rm -f /tmp/cassandra-cpp-driver-dev.deb \
        && curl -L -o /tmp/cassandra.tar.gz "https://github.com/datastax/php-driver/archive/824ba30.tar.gz" \
        && mkdir /tmp/cassandra \
        && tar xfz /tmp/cassandra.tar.gz --strip 1 -C /tmp/cassandra \
        && rm -r /tmp/cassandra.tar.gz \
        && mv /tmp/cassandra/ext /usr/src/php/ext/cassandra \
        && rm -rf /tmp/cassandra \

        && curl -L -o /tmp/psr-php.tar.gz "https://github.com/jbboehr/php-psr/archive/refs/tags/v1.0.1.tar.gz" \
        && mkdir /tmp/psr-php \
        && tar xfz /tmp/psr-php.tar.gz --strip 1 -C /tmp/psr-php \
        && rm -r /tmp/psr-php.tar.gz \
        && mv /tmp/psr-php/ /usr/src/php/ext/psr-php \
        && rm -rf /tmp/psr-php \

        && curl -L -o /tmp/phalcon4.tar.gz "https://github.com/phalcon/cphalcon/archive/refs/tags/v4.1.0.tar.gz" \
        && mkdir /tmp/phalcon4 \
        && tar xfz /tmp/phalcon4.tar.gz --strip 1 -C /tmp/phalcon4 \
        && rm -r /tmp/phalcon4.tar.gz \
        && mv /tmp/phalcon4/ext /usr/src/php/ext/phalcon4 \
        && rm -rf /tmp/phalcon4 \

        && docker-php-ext-install psr-php phalcon4 cassandra \
