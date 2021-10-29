truecaller-on-termux:

DIR := $(PREFIX)/lib/node_modules/truecallerjs
SVDIR := $(PREFIX)/var/service

install: truecaller-on-termux
	pkg i nodejs jq termux-api termux-services -y
	@ if [ -d "$DIR" ]; then \
		echo "Truecallerjs already installed, please wait ..."; \
	else \
		echo "Installing truecallerjs , please wait ..."; \
		npm install -g truecallerjs ; \
	fi
	@ if [ -z "$DIR/.secret/authkey.json" ]; then \
		echo "Already logged in to your account, please wait ..."; \
	else \
		echo "Please Login to your Truecaller account"; \
		truecallerjs login ; \
	fi
	mkdir -p $(PREFIX)/var/service/truecallerjs/log/
	ln -sf $(PREFIX)/share/termux-services/svlogger $(PREFIX)/var/service/truecallerjs/log/run
	install -m 0777 run $(PREFIX)/var/service/truecallerjs/
	install -m 0777 start-truecallerjs $(PREFIX)/var/service/truecallerjs/
	$(eval SVDIR = `export SVDIR=$$PREFIX/var/service`)
	sv up truecallerjs
	sv-enable truecallerjs

uninstall:
	sv-diable truecallerjs
	sv-down truecallerjs
	rm -f $(PREFIX)/var/service/truecallerjs/start-truecallerjs
	rm -f $(PREFIX)/bin/truecallerjs
	rm -Rf $(PREFIX)/lib/node_modules/truecallerjs
	rm -Rf $(PREFIX)/var/service/truecallerjs


.PHONY: install uninstall
