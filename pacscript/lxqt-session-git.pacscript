# Maintainer: isf63 <@>

_pkgname=lxqt-session
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc='LXQt session'
arch=('amd64')
url="https://lxqt-project.org"
license=('LGPL-2.1-only')
depends=('procps' 'layer-shell-qt' 'libkf6windowsystem6' 'layer-shell-qt'
         'xdg-user-dirs' 'qtxdg-tools-git' 'liblxqt-git')
optdepends=('sddm: The recommended LXQt display manager')
makedepends=('git' 'cmake' 'libproc2-dev' 'liblayershellqtinterface-dev' 'qt6-tools-dev' 'lxqt-build-tools-git')
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
