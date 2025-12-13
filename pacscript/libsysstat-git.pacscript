# Maintainer: isf63 <@>

_pkgname=libsysstat
pkgname=$_pkgname-git
pkgver=1.1.0
pkgrel=1
pkgdesc='Library to query system information like CPU and memory usage or network traffic'
arch=('amd64')
url='https://github.com/lxqt/libsysstat'
license=("LGPL-2.1-only")
depends=('libqt6core6t64')
makedepends=('git' 'cmake' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=("SKIP")

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
