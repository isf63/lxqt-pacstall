# Maintainer: isf63 <@>

_pkgname=lxqt-config
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc="LXQt system configuration."
arch=('amd64')
url="https://lxqt-project.org"
license=('LGPL-2.1-only')
depends=('libqt6gui6' 'libxi6' 'libxcursor1' 'libkf6screen8' 'libkscreen-bin' 'liblxqt-git' 'lxqt-menu-data-git' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'lxqt-build-tools' 'libudev-dev'
             'libxi-dev' 'libxcb-randr0-dev' 'libxcursor-dev'
             'xserver-xorg-input-libinput' 'xserver-xorg-input-libinput-dev'
             'libkf6windowsystem-dev' 'libkscreen-dev' 'qt6-tools-dev'
             'qt6-svg-dev' 'libglib2.0-dev')
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
  cmake ../$_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
  make -j"${NCPU}"
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
