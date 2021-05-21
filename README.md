# sipp
## zypper/rpm wrapper written in Perl and with a pacman syntax
### Installation
`install.pl` arguments:
* `-u`: uninstall sipp
* `-s`: install as usual, but also symlink `/usr/bin/sipp` to `/usr/bin/pacman`
~~~
git clone https://github.com/joznia/sipp.git
cd sipp
chmod +x install.pl
sudo ./install.pl
~~~
### Usage
* `-S`: install a package
* `-U`: install a local `.rpm`
* `-Rs`: remove a package
* `-Rns`: remove a package (same as -Rs)
* `-Syu`: perform a system upgrade
* `-Syuu`: perform a distribution upgrade
* `-Ss`: search for a package via regex
* `-Q`: search for a locally installed package
* `-Qi`: display installed package information
* `-Si`: display remote package information
* `-Ql`: display files provided by an installed package
* `-Qo`: find which package provides which file
* `-Qc`: show the changelog of a package
* `-Qu`: list packages which are upgradable
* `-Sc`: remove packages from the local package cache
* `-D`: mark an automatically installed package as manually installed
* `-Sw`: download a package without installing it
 
 
