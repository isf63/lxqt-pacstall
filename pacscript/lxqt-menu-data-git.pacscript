# Maintainer: isf63 <@>

_pkgname=lxqt-menu-data
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc='LXQt menu files'
arch=(any)
url='https://lxqt-project.org'
license=('LGPL-2.1-only')
makedepends=('git' 'cmake' 'lxqt-build-tools-git' 'qt6-tools-dev')
conflicts=("${_pkgname}")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  cmake -S lxqt-menu-data -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
