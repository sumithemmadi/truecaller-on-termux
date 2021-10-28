truecaller-on-termux:

install: truecaller-on-termux
	pkg in nodejs jq termux-api termux-services
	npm install -g truecallerjs
	install start-truecallerjs $(PREFIX)/bin/
	mkdir -p $(PREFIX)/var/service/truecallerjs/log/
	ln -sf $(PREFIX)/share/termux-services/svlogger $(PREFIX)/var/service/truecallerjs/log/run
	install -m 0777 run $(PREFIX)/var/service/truecallerjs/
	sv up truecallerjs
	sv-enable truecallerjs

uninstall:
	rm -f $(PREFIX)/bin/start-truecallerjs
	rm -f $(PREFIX)/bin/truecallerjs
	rm -Rf $(PREFIX)/lib/node_modules/truecallerjs
	rm -Rf $(PREFIX)/var/service/truecallerjs
	rm -Rf $(HOME)/.bash_profile

fix:
	service-daemon restart

.PHONY: install uninstall
