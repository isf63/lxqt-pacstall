# Maintainer: isf63 <@>

_pkgname=pcmanfm-qt
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc='The LXQt file manager, Qt port of PCManFM'
arch=('amd64')
url='https://lxqt-project.org'
license=('custom:GPL-2.0-only')
depends=('libqt6gui6' 'libgcc-s1' 'libfm-qt-git' 'libglib2.0-0t64' 'hicolor-icon-theme'
         'libxcb-util1' 'layer-shell-qt' 'lxqt-menu-data-git')
makedepends=('git' 'cmake' 'lxqt-build-tools-git' 'qt6-tools-dev'
             'libxcb-util-dev' 'liblayershellqtinterface-dev')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  cd "${_pkgname}"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}
