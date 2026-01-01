# Maintainer: isf63 <@>

_pkgname=lxqt-themes
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc='Themes, graphics and icons for LXQt'
arch=('any')
url="https://lxqt-project.org"
license=('LGPL-2.1-only')
depends=('hicolor-icon-theme')
makedepends=('git' 'cmake' 'lxqt-build-tools-git')
provides=("$_pkgname")
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
  cmake "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr
  make -j"${NCPU}"
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
