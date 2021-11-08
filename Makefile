truecaller-on-termux:
export SVDIR := $(PREFIX)/var/service

install: truecaller-on-termux
	pkg i nodejs jq termux-api termux-services -y
	@ npm install -g truecallerjs 
	@ if [ -f "$(HOME)/.truecallerjs/authkey.json" ]; then \
		echo "\033[1;34mAlready logged in to your account, please wait ...\033[0m"; \
	else \
		echo "\033[1;34mPlease Login to your Truecaller account \033[0m"; \
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
	@ echo "==> \033[1;31mUninstallation Successfull.\033[0m"
	@ echo "==> 1 . Enter the below  command to stop service"
	@ echo "==> \033[1;33m    sv-disable truecallerjs && sv-down truecallerjs\033[0m"

.PHONY: install uninstall
