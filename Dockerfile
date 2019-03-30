FROM centos:latest

LABEL maintainer="Max Castro <github.com/kaioken>, mctekk <github.com/mctekk>"

ARG PHALCON_VERSION=3.4.3
ARG PHALCON_EXT_PATH=php7/64bits

RUN  yum -y install epel-release
RUN  yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN  yum-config-manager --enable remi-php72
RUN  yum -y install initscripts
RUN  yum -y update
RUN  yum -y install php php72-php-common.x86_64 php72-php-devel.x86_64  php72-php-fpm.x86_64 php72-php-gd.x86_64 \
                    php72-php-intl.x86_64 php72-php-json.x86_64 php72-php-mbstring.x86_64 php72-php-mysqlnd.x86_64 \
                    php72-php-pdo.x86_64 php72-php-pecl-cassandra.x86_64 php72-php-pecl-igbinary.x86_64 php72-php-pecl-mongodb.x86_64 \
                    php72-php-pecl-swoole4.x86_64 php72-php-pgsql.x86_64 php72-php-process.x86_64 \ 
                    php72-php-xml.x86_64 php72-php-opcache.x86_64 php72-php-pecl-gmagick.x86_64 php72-php-pecl-geoip.x86_64 \
                    php72-php-pecl-memcache.x86_64 php72-php-pecl-memcached.x86_64 php72-php-pecl-mcrypt.x86_64 php72-php-pecl-redis.x86_64 \
                    php72-php-pecl-zip.x86_64 php72-php-phalcon3.x86_64 php72-php-sodium.x86_64 php72-php-wkhtmltox.x86_64



EXPOSE 9000

#start php-fpm
CMD ["sudo service", "php-fpm start"]
