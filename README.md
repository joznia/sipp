# zpw
## zypper/rpm wrapper written in Perl and with a pacman syntax
### Installation
`install.pl` arguments:
* `-u`: uninstall zpw
* `-s`: install as usual, but also symlink `/usr/bin/zpw` to `/usr/bin/pacman`
~~~
git clone https://github.com/joznia/zpw.git
cd zpw
chmod +x install.pl
sudo ./install.pl
~~~
### Usage
* `-S`: install a package
* `-Sr`: reinstall a package
* `-U`: install a local package in RPM format
* `-Rs`: remove a package
* `-Syu`: perform a system upgrade
* `-Syuu`: perform a distribution upgrade
* `-Ss`: search for a package via regex
* `-Q`: search for a locally installed package
* `-Qi`: display installed package information
* `-Si`: display remote package information
* `-Sii`: show reverse dependencies 
* `-Ql`: display files provided by an installed package
* `-Qo`: find which package provides which file
* `-Qc`: show the changelog of a package
* `-Qu`: list packages which are upgradable
* `-Sc`: remove packages from the local package cache
* `-D`: mark an automatically installed package as manually installed
* `-Sw`: download a package without installing it
* `-Qpl`: list the contents of a local RPM
* `-Sp`: install a sourcepackage
* `-Sd`: install the build dependencies of a sourcepackage
* `-Qk`: verify a package
* `-Qkk`: verify all packages
* `-Dk`: verify dependencies of the system

