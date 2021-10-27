#!/bin/bash
set +o histexpand
pkg in nodejs wget jq termux-api termux-services

npm install -g truecallerjs

cp start-truecallerjs $PREFIX/bin
mkdir -p $PREFIX/var/service/truecaller-on-termux/log
ln -sf $PREFIX/share/termux-services/svlogger $PREFIX/var/service/truecaller-on-termux/log/run

echo -e "#!/bin/bash \nstart-truecallerjs" > $PREFIX/var/service/truecaller-on-termux/run
chmod +x $PREFIX/var/service/truecaller-on-termux/run

sv up start-truecallerjs
sv-enable start-truecallerjs
