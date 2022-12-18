cd /var/www/webs
if [ ! -f /var/log/settup.log ]
then
    chmod -R 777 /var/log/ >> /var/log/settup.log 2>&1
    mkdir /var/log/apache2/ >> /var/log/settup.log 2>&1
    echo "instaling runtime" >> /var/log/settup.log 2>&1
    chmod -R 777 . >> /var/log/settup.log 2>&1
    composer install  >> /var/log/settup.log 2>&1
    npm install --include=dev  >> /var/log/settup.log 2>&1
    cp app/config/config.local.neon.example app/config/config.fof.local.neon >> /var/log/settup.log 2>&1
    cp app/config/config.local.neon.example app/config/config.fol.local.neon >> /var/log/settup.log 2>&1
    cp app/config/config.local.neon.example app/config/config.dsef.local.neon >> /var/log/settup.log 2>&1
    cp app/config/config.local.neon.example app/config/config.fykos.local.neon >> /var/log/settup.log 2>&1
    cp app/config/config.local.neon.example app/config/config.vyfuk.local.neon >> /var/log/settup.log 2>&1
fi
service apache2 start
npm run dev