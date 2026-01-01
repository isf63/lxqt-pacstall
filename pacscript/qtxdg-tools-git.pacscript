# Maintainer: isf63 <@>

_pkgname=qtxdg-tools
pkgname=$_pkgname-git
pkgver=4.3.0
pkgrel=1
pkgdesc="User tools for libqtxdg"
arch=('amd64')
url="https://lxqt-project.org"
license=('LGPL-2.1-only')
depends=('libqtxdg-git')
makedepends=('git' 'cmake' 'lxqt-build-tools-git')
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  cmake -B build -S "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build -j"${NCPU}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
