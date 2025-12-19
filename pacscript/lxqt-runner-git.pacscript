# Maintainer: isf63 <@>

_pkgname=lxqt-runner
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc='The LXQt application launcher'
arch=('amd64')
url="https://lxqt-project.org"
license=('LGPL-2.1-only')
depends=('layer-shell-qt' 'libkf6windowsystem6' 'lxqt-globalkeys-git' 'libmuparser2v5')
makedepends=('git' 'cmake' 'libmuparser-dev' 'liblayershellqtinterface-dev' 'qt6-tools-dev' 'lxqt-build-tools-git')
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
