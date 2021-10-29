truecaller-on-termux:

install: truecaller-on-termux
	pkg i nodejs jq termux-api termux-services -y
	@ if [ -d "$(PREFIX)/lib/node_modules/truecallerjs" ]; then \
		echo "Truecallerjs already installed, please wait ..."; \
	else \
		echo "Installing truecallerjs , please wait ..."; \
		npm install -g truecallerjs ; \
	fi
	install authkey.json  $(PREFIX)/lib/node_modules/truecallerjs/.secret/
	@ if [ -f "$(PREFIX)/lib/node_modules/truecallerjs/.secret/authkey.json" ]; then \
		echo "Already logged in to your account, please wait ..."; \
	else \
		echo "Please Login to your Truecaller account"; \
		truecallerjs login ; \
	fi
	@ mkdir -p $(PREFIX)/var/service/truecallerjs/log/
	@ ln -sf $(PREFIX)/share/termux-services/svlogger $(PREFIX)/var/service/truecallerjs/log/run
	install .bash_profile $(HOME)/
	install -m 0777 run $(PREFIX)/var/service/truecallerjs/
	reset
	sv up truecallerjs
	sv-enable truecallerjs

uninstall:
	sv-diable truecallerjs
	sv-down truecallerjs
	rm -f $(PREFIX)/bin/truecallerjs
	rm -Rf $(PREFIX)/lib/node_modules/truecallerjs
	rm -Rf $(PREFIX)/var/service/truecallerjs
	rm -f $(HOME)/.bash_profile


.PHONY: install uninstall
