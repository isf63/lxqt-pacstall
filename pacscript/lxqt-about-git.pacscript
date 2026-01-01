# Maintainer: isf63 <@>

_pkgname=lxqt-about
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc="LXQt about dialog."
arch=('amd64')
url="https://lxqt-project.org"
license=('GPL-2.0-only')
depends=('liblxqt-git' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt6-tools-dev' 'lxqt-build-tools-git')
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
  make -j"${NCPU}"
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
