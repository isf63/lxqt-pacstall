# Maintainer: isf63 <@>

_pkgname='pavucontrol-qt'
pkgname="$_pkgname-git"
pkgver=2.3.0
pkgrel=1
pkgdesc='Qt port of pavucontrol'
arch=('amd64')
url="https://github.com/lxqt/$_pkgname"
license=('GPL-2.0-only')
depends=('libqt6gui6' 'libpulse0' 'libpulse-mainloop-glib0')
makedepends=('git' 'cmake' 'libpulse-dev' 'qt6-tools-dev' 'lxqt-build-tools-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  rm -Rf build ; mkdir build ; cd build
  cmake $srcdir/$_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr
  make -j"${NCPU}"
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
