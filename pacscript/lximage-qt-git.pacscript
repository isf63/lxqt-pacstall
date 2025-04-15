# Maintainer: isf63 <@>

_pkgname=lximage-qt
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc="The LXQt image viewer"
arch=('amd64')
url="https://github.com/lxqt/$_pkgname"
license=('GPL-2.0-only')
depends=('libfm-qt-git' 'libqt6svgwidgets6' 'libqt6svg6' 'hicolor-icon-theme')
optdepends=(
  'qt6-image-formats-plugins: support for additional image formats (WEBP, TIFF, etc.)'
  'kimageformat6-plugins: support for additional image formats (PCX, XCF, HEIF, etc.)'
)
makedepends=('git' 'cmake' 'lxqt-build-tools-git' 'libexif-dev' 'libcups2-dev' 'libxfixes-dev'
             'libxcb-util-dev' 'libxcb-composite0-dev' 'libxcb-shape0-dev' 'libxcb-xfixes0-dev' 'libxcb-damage0-dev'
             'libxcb-dpms0-dev' 'libxcb-image0-dev' 'libxcb-randr0-dev' 'libxcb-screensaver0-dev'
             'libxcb-cursor-dev' 'libxkbcommon-x11-dev' ''libmenu-cache-dev'' 'qt6-svg-dev' 'qt6-tools-dev')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgname
  mkdir -p build
}

build() {
  cd $_pkgname/build
  cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make -j"${NCPU}"
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir" install
}
