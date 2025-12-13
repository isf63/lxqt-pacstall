# Maintainer: isf63 <@>

_pkgname=xdg-desktop-portal-lxqt
pkgname=$_pkgname-git
pkgver=1.3.0
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using Qt/KF5'
arch=('amd64')
url='https://github.com/lxqt/xdg-desktop-portal-lxqt'
license=('custom:LGPL')
depends=('libqt6core6t64' 'libkf6windowsystem6' 'xdg-desktop-portal' 'lxqt-qtplugin-git' 'libfm-qt-git')
makedepends=('git' 'cmake')
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
