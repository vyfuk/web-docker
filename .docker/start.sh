if [ ! -f /var/log/settup.log ]
then
    chmod -R 777 /var/log/
    echo "instaling runtime" >> /var/log/settup.log
    cd /var/www/fykos-webs
    chmod -R 777 .
    composer install
    npm install --dev
    npm run build &
    git config core.fileMode false
    cp app/config/config.local.neon.example app/config/config.fof.local.neon
    cp app/config/config.local.neon.example app/config/config.fol.local.neon
    cp app/config/config.local.neon.example app/config/config.dsef.local.neon
    cp app/config/config.local.neon.example app/config/config.fykos.local.neon
    cp app/config/config.local.neon.example app/config/config.vyfuk.local.neon
fi
cd /var/www/fykos-webs
service apache2 start
tail -f /var/www/fykos-webs/log/.gitignore &
npm run dev