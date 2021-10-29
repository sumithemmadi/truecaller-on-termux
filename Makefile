truecaller-on-termux:

DIR=$(PREFIX)/lib/node_modules/truecallerjs

install: truecaller-on-termux
	pkg i nodejs jq termux-api termux-services -y
	@ if [ -d "$DIR" ]; then \
		echo "'$DIR' found , please wait ..."\
	else \
		echo "Warning: '$DIR' NOT found." \
		npm install -g truecallerjs \
	fi
	mkdir -p $(PREFIX)/var/service/truecallerjs/log/
	ln -sf $(PREFIX)/share/termux-services/svlogger $(PREFIX)/var/service/truecallerjs/log/run
	install -m 0777 run $(PREFIX)/var/service/truecallerjs/
	install -m 0777 start-truecallerjs $(PREFIX)/var/service/truecallerjs/
	sv up truecallerjs
	sv-enable truecallerjs

uninstall:
	sv-diable truecallerjs
	sv-down truecallerjs
	rm -f $(PREFIX)/var/service/truecallerjs/start-truecallerjs
	rm -f $(PREFIX)/bin/truecallerjs
	rm -Rf $(PREFIX)/lib/node_modules/truecallerjs
	rm -Rf $(PREFIX)/var/service/truecallerjs
	rm -Rf $(HOME)/.bash_profile
	service-daemon stop

fix:
	export SVDIR="/data/data/com.termux/files/usr/var/service"
	service-daemon start
	service-daemon restart
	sv-disable truecallerjs
	sv down truecallerjs
	find -L  $(PREFIX)/var/service/truecallerjs -type f \( -name "pid" -o -name "lock" \) -delete
	# starts the service
	sv up truecallerjs
	# verify service status
	sv s truecallerjs
	sv-enable truecallerjs

.PHONY: install uninstall fix
