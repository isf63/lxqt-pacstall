# Maintainer: isf63 <@>

_pkgname=lxqt-admin
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc='LXQt system administration'
arch=('amd64')
url="https://lxqt.github.io"
license=("LGPL-2.1-only")
depends=('liblxqt-git')
optdepends=('lxqt-policykit-git: polkit authentication agent provided by LXQt')
makedepends=('git' 'cmake' 'libpolkit-qt6-1-dev' 'qt6-tools-dev' 'lxqt-build-tools-git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/${_pkgname}"
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
