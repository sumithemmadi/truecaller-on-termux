# Truecaller-on-termux
Simple Truecaller on Termux

## Installation and Login

- First clone this repository 
```bash
git clone https://github.com/sumithemmadi/truecaller-on-termux.git
cd truecaller-on-termux
```

- Set **SVDIR=/data/data/com.termux/files/usr/var/service** as a environment variable
```bash
export SVDIR := $PREFIX/var/service
```

- Enter the below command 
```
make install
```

### To uninstall 
```
make uninstall
```
- Then login 
```
truecallerjs login
```
