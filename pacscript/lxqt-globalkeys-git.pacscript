# Maintainer: isf63 <@>

_pkgname=lxqt-globalkeys
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc="LXQt daemon and library for global keyboard shortcuts registration."
arch=('amd64')
url="https://lxqt-project.org"
license=("LGPL-2.1-only")
depends=('liblxqt-git')
makedepends=('git' 'cmake' 'libkf6windowsystem-dev' 'qt6-svg-dev' 'qt6-tools-dev' 'lxqt-build-tools-git')
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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
