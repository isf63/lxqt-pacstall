# Maintainer: isf63 <@>

_pkgname=libqtxdg
pkgname=$_pkgname-git
pkgver=4.3.0
pkgrel=1
pkgdesc="Library providing freedesktop.org specs implementations for Qt."
arch=('amd64')
url="https://lxqt-project.org"
license=("LGPL-2.1-only")
depends=('libqt6core6t64' 'libqt6svg6')
makedepends=('git' 'cmake' 'qt6-base-private-dev' 'qt6-svg-dev' 'lxqt-build-tools-git')
checkdepends=('xvfb')
provides=("libqt6xdg4=$pkgver")
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
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTS=ON
  make
}

check() {
  cd build
  xvfb-run make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
