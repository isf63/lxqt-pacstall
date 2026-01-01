# Maintainer: isf63 <@>

_pkgname=lxqt-panel
pkgname=$_pkgname-git
pkgver=2.3.2
pkgrel=1
pkgdesc='The LXQt desktop panel'
arch=('amd64')
url='https://github.com/lxqt/lxqt-panel'
license=('LGPL-2.1-only')
depends=('libstatgrab10t64' 'libqt6gui6' 'libxtst6' 'libasound2t64' 'libpulse0' 'layer-shell-qt'
         'libkf6solid6' 'libkf6windowsystem6' 'libkwaylandclient6' 'libkf6screendpms8'
         'libsysstat-git' 'libsensors5' 'libdbusmenu-lxqt-git' 'liblxqt-git' 'lxqt-menu-data-git' 'lxqt-globalkeys-git')
makedepends=('git' 'cmake' 'lxqt-build-tools-git'
             'libasound2-dev' 'libpulse-dev' 'libxtst-dev'
             'libxcb-util-dev' 'libxcb-damage0-dev' 'libxcb-image0-dev' 'libxcb-randr0-dev' 'libxcb-composite0-dev'
             'libxcb-xkb-dev' 'libxkbcommon-x11-dev' 'libstatgrab-dev'
             'libsensors-dev' 'libkscreen-dev' 'libkf6solid-dev' 'libkf6windowsystem-dev'
             'qt6-base-private-dev' 'qt6-wayland-private-dev' 'qt6-svg-dev' 'liblayershellqtinterface-dev'
             'qt6-tools-dev')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr \
       -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make -j"${NCPU}"
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
