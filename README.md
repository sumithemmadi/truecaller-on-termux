# Truecaller-on-termux
Simple Truecaller on Termux

## Installation and Login

First clone this repository 
```bash
git clone https://github.com/sumithemmadi/truecaller-on-termux.git
cd truecaller-on-termux
```

- Enter the below command 
```
make install
```
- Then [login](https://github.com/sumithemmadi/truecaller-on-termux) to your Truecaller account.
- If you get any error just close termux app and reopen it.
- Then start truecallerjs service.
```
sv up truecallerjs
sv-enable truecallerjs
```

### To uninstall 
```
make uninstall
```

Then stop service with below command

```
sv down truecallerjs
sv-disable truecallerjs
```
