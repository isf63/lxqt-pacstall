# Maintainer: isf63 <@>

_pkgname=lxqt-powermanagement
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc='LXQt power management daemon'
arch=('amd64')
url="https://lxqt-project.org"
license=("LGPL-2.1-only")
depends=('libqt6gui6' 'libqt6svg6' 'upower' 'libkf6idletime6' 'libkf6solid6'
         'liblxqt-git' 'lxqt-globalkeys-git' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'libglib2.0-dev' 'libupower-glib-dev' 'qt6-tools-dev' 'qt6-svg-dev'
             'libkf6idletime-dev' 'libkf6solid-dev' 'libkf6windowsystem-dev'
             'libxcb-dpms0-dev' 'libxcb-screensaver0-dev' 'libxcb-randr0-dev'
             'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
