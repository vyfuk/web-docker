cd /var/www/fykos-webs
if [ ! -f /var/log/settup.log ]
then
    chmod -R 777 /var/log/
    mkdir /var/log/apache2/
    echo "instaling runtime" >> /var/log/settup.log
    chmod -R 777 .
    composer install  >> /var/log/settup.log
    npm install --include=dev  >> /var/log/settup.log
    cp app/config/config.local.neon.example app/config/config.fof.local.neon
    cp app/config/config.local.neon.example app/config/config.fol.local.neon
    cp app/config/config.local.neon.example app/config/config.dsef.local.neon
    cp app/config/config.local.neon.example app/config/config.fykos.local.neon
    cp app/config/config.local.neon.example app/config/config.vyfuk.local.neon
fi
service apache2 start
npm run dev