# Truecaller-on-termux
Simple Truecaller on Termux

[![Version](https://img.shields.io/badge/Version-1.0.3-blue)](https://github.com/sumithemmadi/truecaller-on-termux)
[![stars](https://img.shields.io/github/stars/sumithemmadi/truecaller-on-termux)](https://github.com/sumithemmadi/truecaller-on-termux)
[![MIT Licence](http://img.shields.io/github/license/sumithemmadi/truecaller-on-termux)](https://github.com/sumithemmadi/truecaller-on-termux)
[![issues](https://img.shields.io/github/issues/sumithemmadi/truecaller-on-termux)](https://github.com/sumithemmadi/truecaller-on-termux)
<!--
<div class="row">
  <div class="column">
    <img src="https://www.w3schools.com/howto/img_snow.jpg"  width="42" height="42" style="float:left">
    <img src="https://www.w3schools.com/howto/img_forest.jpg" width="42" height="42"  style="float:middle">
    <img src="https://www.w3schools.com/howto/img_mountains.jpg" width="42" height="42"  style="float:right">
  </div>
</div>
-->
## Installation and Login

First clone this repository 
```bash
git clone https://github.com/sumithemmadi/truecaller-on-termux.git
cd truecaller-on-termux
```

```
make install
```
Then [login](https://github.com/sumithemmadi/truecaller-on-termux) to your Truecaller account.

After installation you need to restart session or source this file:

```bash
source start-truecallerjs.sh
```

Now you ready to enable and start the `truecallerjs` daemon service:
```bash
sv-enable truecallerjs
sv up truecallerjs
```
If you need to stop, run `sv down truecallerjs`
> **Note** : If you get any error just close the termux app and reopen it.Then start truecallerjs services.

### To uninstall 
```
make uninstall
```

Then stop service with below command

```
sv down truecallerjs
sv-disable truecallerjs
```
## LICENSE

MIT License

Copyright (c) 2021 **Emmadi Sumith Kumar**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

