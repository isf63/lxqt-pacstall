# Maintainer: isf63 <@>

_pkgname=libfm-qt
pkgname=$_pkgname-git
pkgver=2.3.1
pkgrel=1
pkgdesc='Qt port of libfm, a library providing components to build desktop file managers'
arch=('amd64')
url='https://lxqt-project.org'
license=('LGPL-2.1-only')
depends=('libgcc-s1' 'libglib2.0-0t64' 'libexif12' 'libmenu-cache3' 'libqt6gui6' 'lxqt-menu-data-git')
makedepends=('git' 'cmake' 'lxqt-build-tools-git' 'libmenu-cache-dev' 'libexif-dev' 'libglib2.0-dev'
             'libxcb-util-dev' 'libxcb-cursor-dev' 'libxcb-image0-dev'
# Need more libxcb-*-dev ?
             'qt6-tools-dev' 'qt6-base-private-dev')
optdepends=('gvfs: support for the trash bin and network devices')
provides=("libfm-qt6-15=$pkgver" "libfm-qt6-common=$pkgver")
conflicts=("${_pkgname}" 'pcmanfm-qt<=0.10.0')
source=('git+https://github.com/lxqt/libfm-qt.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  cd ${_pkgname}

  cmake -S . -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -Wno-dev
  cmake --build build -j"${NCPU}"
}

package() {
  cd ${_pkgname}

  DESTDIR="${pkgdir}" cmake --install build

  # CMake installs empty folders unexpectedly
  # https://gitlab.kitware.com/cmake/cmake/issues/17122
  rmdir "${pkgdir}"/usr/include/libfm-qt6/{tests,translations}
}
