# Maintainer: isf63 <@>

_pkgname=lxqt-archiver
pkgname=$_pkgname-git
pkgver=1.3.0
pkgrel=1
pkgdesc=" A simple & lightweight desktop-agnostic Qt file archiver"
arch=('amd64')
url="https://lxqt.org"
license=('GPL-2.0-or-later')
depends=('libfm-qt-git' 'libglib2.0-0t64' 'libjson-glib-1.0-0' 'libxcb-util1')
makedepends=('git' 'cmake' 'lxqt-build-tools-git' 'libmenu-cache-dev' 'libexif-dev'
             'libxcb-util-dev' 'libxcb-cursor-dev'
             'libglib2.0-dev'  'libjson-glib-dev' 'qt6-tools-dev')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        "$srcdir/$_pkgname"
  make -j"${NCPU}"
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
