# Maintainer:  isf63 <@>

_pkgname=qps
pkgname=$_pkgname-git
pkgver=2.12.0
pkgrel=1
pkgdesc='Qt process manager'
arch=('amd64')
url="https://lxqt-project.org"
license=("GPL-2.0-only")
depends=('liblxqt-git' 'hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git' 'cmake' 'qt6-tools-dev' 'lxqt-build-tools-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
    mkdir build ; cd build
    cmake ../$_pkgname -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR=$pkgdir install
}
