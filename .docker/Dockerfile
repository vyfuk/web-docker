FROM node:19-bullseye
# neinteragovat
ARG DEBIAN_FRONTEND=noninteractive

# instalace
RUN apt-get update && \
apt-get -y upgrade && \
apt-get install -y curl git unzip gettext lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 wget && \
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list && \
curl -fsSL https://packages.sury.org/php/apt.gpg| gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg && \
#wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb && \
#dpkg -i mysql-apt-config_0.8.24-1_all.deb && \
apt-get update && \
#apt-get install -y php8.1 mysql-community-server php-cli php-mbstring libapache2-mod-php apache2 locales php8.1-soap php8.1-xml && \
apt-get install -y php8.1 php-cli php-mbstring libapache2-mod-php apache2 locales php8.1-soap php8.1-xml && \
curl -sS https://getcomposer.org/installer -o composer-setup.php && \
HASH=`curl -sS https://composer.github.io/installer.sig` && \
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
locale-gen cs_CZ && locale-gen cs_CZ.UTF-8 && locale-gen en_US && locale-gen en_US.UTF-8 && update-locale

##db ini
#RUN mkdir /tmp/sql/
#ADD ./webs/data/sql/ /tmp/sql/
#RUN usermod -d /var/lib/mysql/ mysql && \
#service mysql start && \
#mysql -u root -e "create database fol ; create database fof ; CREATE USER 'fykos'@'localhost' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON fol.* TO 'fykos'@'localhost' WITH GRANT OPTION;" && \
#mysql -u fykos --password=password fol < /tmp/sql/schema_fol.sql && \
#mysql -u fykos --password=password fol < /tmp/sql/example_fol.sql && \
#service mysql stop && \
#rm -R /tmp/sql/ && \
#chmod -R 0777 /var/run/mysqld

#apache
RUN a2enmod php8.1 rewrite
ADD .docker/fykos-webs.conf /etc/apache2/sites-enabled/fykos-webs.conf

#run
ADD ./.docker/start.sh /var/www/start.sh
ENTRYPOINT ["bash", "/var/www/start.sh"]