# web-docker

## install
1. setup your host file (C:\Windows\System32\drivers\etc\hosts or /etc/hosts):
```hosts
127.0.0.1    vyfuk.cz.local
127.0.0.1    vyfuk.org.local
127.0.0.1    online.fyziklani.cz.local
127.0.0.1    online.fyziklani.org.local
127.0.0.1    fyziklani.cz.local
127.0.0.1    fyziklani.org.local
127.0.0.1    dsef.cz.local
127.0.0.1    dsef.org.local
127.0.0.1    fykos.cz.local
127.0.0.1    fykos.org.local
```

2. Clone the repository to linux/wsl `git clone --recurse-submodules ...`
3. Run `git config core.fileMode false` to suppers chmod being a change. 
4. Run `docker-compose up` it takes more than 500s.
5. Done.