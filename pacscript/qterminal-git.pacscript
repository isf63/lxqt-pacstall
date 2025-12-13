# Maintainer: isf63 <@>

_pkgname=qterminal
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc="Lightweight Qt-based terminal emulator"
arch=('amd64')
url="https://github.com/lxqt/qterminal"
license=("GPL2")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('qtermwidget-git' 'libcanberra0')
makedepends=('git' 'cmake' 'libcanberra-dev' 'qt6-tools-dev' 'lxqt-build-tools-git')
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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
