# Maintainer: isf63 <@>

_pkgname=lxqt-notificationd
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc="LXQt notification daemon and library."
arch=('amd64')
url="https://lxqt-project.org"
license=('LGPL-2.1-only')
depends=('layer-shell-qt' 'liblxqt-git' 'libkf6windowsystem6')
makedepends=('git' 'cmake' 'liblayershellqtinterface-dev' 'qt6-tools-dev' 'lxqt-build-tools-git')
provides=("$_pkgname" "notification-daemon")
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
