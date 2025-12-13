# Maintainer: isf63 <@>

_pkgname=liblxqt
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc="Common base library for LXQt components."
arch=('amd64')
url="https://lxqt-project.org"
license=('LGPL-2.1-only')
depends=('libqt6gui6' 'libqt6dbus6' 'libpolkit-qt6-1-1' 'libkf6windowsystem6' 'libqtxdg-git' 'libxss1')
makedepends=('git' 'cmake' 'qt6-svg-dev' 'qt6-tools-dev' 'lxqt-build-tools-git'
             'libglib2.0-dev' 'libxss-dev' 'libkf6windowsystem-dev' 'libpolkit-qt6-1-dev')
provides=('liblxqt2' 'liblxqt-l10n')
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
