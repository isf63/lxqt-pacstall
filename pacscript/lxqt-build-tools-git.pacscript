# Maintainer: isf63 <@>

_pkgname=lxqt-build-tools
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc='Tools to build LXQt and components maintained by the project.'
arch=('any')
url='https://github.com/lxqt/lxqt-build-tools'
license=('custom:BSD')
depends=('cmake')
makedepends=('git' 'qt6-base-dev')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  rm -Rf build ; mkdir build
  cd build
  cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -D -m644 $srcdir/$_pkgname/BSD-3-Clause $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
