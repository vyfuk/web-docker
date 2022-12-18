FROM node:19-bullseye
# neinteragovat
ARG DEBIAN_FRONTEND=noninteractive

# instalace
ADD docker/webs.conf /etc/apache2/sites-enabled/webs.conf
ADD docker/installComposer.sh /tmp/installComposer.sh
RUN apt-get update && apt-get -y upgrade && \
apt-get install -y curl apt-transport-https && \
echo "deb https://packages.sury.org/php/ bullseye main" | tee /etc/apt/sources.list.d/sury-php.list && \
curl -fsSL https://packages.sury.org/php/apt.gpg| gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg && \
apt-get update && \
apt-get install -y php8.1 php8.1-cli php8.1-mbstring libapache2-mod-php apache2 locales php8.1-soap php8.1-xml && \
a2enmod php8.1 rewrite && \
sh /tmp/installComposer.sh && \
locale-gen cs_CZ && locale-gen cs_CZ.UTF-8 && locale-gen en_US && locale-gen en_US.UTF-8 && update-locale

#run
ADD ./docker/start.sh /var/www/start.sh
ENTRYPOINT ["bash", "/var/www/start.sh"]