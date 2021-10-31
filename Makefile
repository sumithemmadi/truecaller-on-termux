#!/data/data/com.termux/files/usr/bin/bash

## MIT License

## Copyright (c) 2021 Emmadi Sumith Kumar

## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:

## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.

## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.

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
	install .bash_profile $(HOME)/
	install -m 0777 run $(PREFIX)/var/service/truecallerjs/
	sv up truecallerjs
	sv-enable truecallerjs

uninstall:
	@ rm -f $(PREFIX)/bin/truecallerjs
	@ rm -Rf $(PREFIX)/lib/node_modules/truecallerjs
	@ rm -Rf $(PREFIX)/var/service/truecallerjs
	@ rm -f $(HOME)/.bash_profile
	@ echo -e "Enter the below  command to stop service \n\n  sv-diable truecallerjs && sv-down truecallerjs"

.PHONY: install uninstall
