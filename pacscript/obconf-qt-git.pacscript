# Maintainer: isf63 <@>

_pkgname=obconf-qt
pkgname=$_pkgname-git
pkgver=0.16.6
pkgrel=1
pkgdesc='Openbox configuration tool. Qt port of ObConf'
arch=('amd64')
url='http://lxqt.org'
license=('GPL-2.0-or-later')
depends=('hicolor-icon-theme' 'openbox' 'libqt6gui6')
makedepends=('git' 'cmake' 'openbox-dev' 'qt6-tools-dev' 'lxqt-build-tools-git')
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
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
