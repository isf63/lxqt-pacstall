# Maintainer: isf63 <@>

_pkgname=screengrab
pkgname=$_pkgname-git
pkgver=3.0.0
pkgrel=1
pkgdesc="Crossplatform tool for grabbing screenshots of your desktop."
arch=('amd64')
url="https://github.com/lxqt/screengrab"
license=("GPL-2.0-only")
depends=('libkf6windowsystem6' 'libqtxdg-git' 'hicolor-icon-theme' 'layer-shell-qt' 'libx11-xcb1')
makedepends=('git' 'cmake' 'qt6-base-private-dev' 'qt6-wayland-private-dev' 'liblayershellqtinterface-dev' 'qt6-tools-dev'
             'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make install DESTDIR="$pkgdir"
}
