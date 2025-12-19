# Maintainer: isf63 <@>

_pkgname=lxqt-openssh-askpass
pkgname=$_pkgname-git
pkgver=2.2.0
pkgrel=1
pkgdesc='LXQt OpenSSH password prompt'
arch=('amd64')
url="https://lxqt.github.io"
license=('LGPL-2.1-only')
depends=('liblxqt-git')
makedepends=('git' 'cmake' 'qt6-tools-dev' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/${_pkgname}.git")
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
