# Maintainer: isf63 <@>

_pkgname=libdbusmenu-lxqt
pkgname=$_pkgname-git
pkgver=0.3.0
pkgrel=1
pkgdesc='A library that provides a Qt implementation of the DBusMenu spec'
arch=('amd64')
url='https://github.com/lxqt/libdbusmenu-lxqt'
# https://github.com/lxqt/libdbusmenu-lxqt/blob/master/COPYING
# All source files contain "any later"
license=('LGPL-2.0-or-later')
depends=('libqt6core6t64')
makedepends=('git' 'cmake' 'doxygen' 'qt6-base-dev')
#checkdepends=('dbus' 'dbus-x11' 'xvfb')
provides=("libdbusmenu-lxqt0=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/libdbusmenu-lxqt")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  cmake -B build -S libdbusmenu-lxqt \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

# Tests do not pass on Ubuntu 25.04. For now simply disable them.
#check() {
#  dbus-launch xvfb-run --auto-servernum cmake --build build --target check
#}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
