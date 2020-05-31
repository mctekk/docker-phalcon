FROM centos:centos7

LABEL maintainer="Max Castro <github.com/kaioken>, mctekk <github.com/mctekk>"

ARG PHALCON_VERSION=3.4.5
ARG PHALCON_EXT_PATH=php7/64bits

RUN  yum -y install epel-release
RUN  yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN  yum-config-manager --enable remi-php72
RUN  yum -y install initscripts
RUN  yum -y update
RUN yum -y install vim unzip git

RUN  yum -y install php php-common.x86_64 php-devel.x86_64  php-fpm.x86_64 php-gd.x86_64 \
                    php-intl.x86_64 php-json.x86_64 php-mbstring.x86_64 php-mysqlnd.x86_64 \
                    php-pdo.x86_64 php-pecl-cassandra.x86_64 php-pecl-igbinary.x86_64 php-pecl-mongodb.x86_64 \
                    php-pecl-swoole4.x86_64 php-pgsql.x86_64 php-process.x86_64 php-bcmath.x86_64 \
                    php-xml.x86_64 php-opcache.x86_64 php-pecl-gmagick.x86_64 php-pecl-geoip.x86_64 \
                    php-pecl-memcache.x86_64 php-pecl-memcached.x86_64 php-pecl-mcrypt.x86_64 php-pecl-redis.x86_64 \
                    php-pecl-zip.x86_64 php-phalcon3.x86_64 php-sodium.x86_64 php-wkhtmltox.x86_64 composer.noarch \
                    php-pecl-decimal.x86_64 php-pecl-ds.x86_64 php-pecl-rdkafka.x86_64 php-soap.x86_64

RUN yum -y install xauth wget xorg-x11-server-Xvfb

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN unxz wkhtmltox-0.12.4_linux-generic-amd64.tar.xz 
RUN tar -xvf wkhtmltox-0.12.4_linux-generic-amd64.tar
RUN mv wkhtmltox/bin/* /usr/local/bin/ 
RUN rm -rf wkhtmltox 
RUN rm -f wkhtmltox-0.12.4_linux-generic-amd64.tar

RUN yum -y install libreoffice-headless

RUN  yum -y update

RUN composer global require --no-interaction hirak/prestissimo

#RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN mkdir /run/php-fpm
RUN rm -f /etc/php-fpm.d/www.conf

ENV PATH $HOME/.composer/vendor/bin:$PATH

COPY www.conf /etc/php-fpm.d/

EXPOSE 9000

#start PHP-FPM
CMD [ "php-fpm", "-F"]
