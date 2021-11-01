truecaller-on-termux:
export SVDIR := $(PREFIX)/var/service

install: truecaller-on-termux
	pkg i nodejs jq termux-api termux-services -y
	@ if [ -d "$(PREFIX)/lib/node_modules/truecallerjs" ]; then \
		echo "Truecallerjs already installed, please wait ..."; \
	else \
		echo "Installing truecallerjs , please wait ..."; \
		npm install -g truecallerjs ; \
	fi
	@ if [ -f "$(PREFIX)/lib/node_modules/truecallerjs/.secret/authkey.json" ]; then \
		echo "Already logged in to your account, please wait ..."; \
	else \
		echo "Please Login to your Truecaller account"; \
		truecallerjs login ; \
	fi
	@ mkdir -p $(PREFIX)/var/service/truecallerjs/log/
	@ ln -sf $(PREFIX)/share/termux-services/svlogger $(PREFIX)/var/service/truecallerjs/log/run
	@ install -m 0777 run $(PREFIX)/var/service/truecallerjs/
	@ echo "==> \033[1;32mInstallation Successful.\033[0m"
	@ echo "==> 1 . You need to restart session or source this file:"
	@ echo "==> \033[1;33m    source start-truecallerjs.sh\033[0m"
	@ echo "==> 2 . start the truecallerjs daemon service:"
	@ echo "==> \033[1;33m    sv-enable truecallerjs\033[0m"
	@ echo "==> \033[1;33m    sv up truecallerjs\033[0m"

uninstall:
	@ rm -f $(PREFIX)/bin/truecallerjs
	@ rm -Rf $(PREFIX)/lib/node_modules/truecallerjs
	@ rm -Rf $(PREFIX)/var/service/truecallerjs
	@ echo "==> \033[1;31mUninstallation Successful."
	@ echo "==> Enter the below  command to stop service"
	@ echo "==> \033[1;33m==>    sv-diable truecallerjs && sv-down truecallerjs\033[0m"

.PHONY: install uninstall
