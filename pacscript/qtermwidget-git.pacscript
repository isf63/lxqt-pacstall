# Maintainer: isf63 <@>

_pkgname=qtermwidget
pkgname=$_pkgname-git
pkgver=2.3.0
pkgrel=1
pkgdesc="A terminal widget for Qt, used by QTerminal"
arch=('amd64')
url="https://github.com/lxqt/qtermwidget"
# Yep, it's messy when you're talking about licenses
license=("custom:LGPL" "custom:BSD" "custom:Public Domain")
depends=('libqt6gui6')
makedepends=('git' 'cmake' 'lxqt-build-tools-git' 'qt6-tools-dev'
             'python3-pyqt6' 'python3-pyqtbuild' 'sip-tools' 'python3-installer')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
optdepends=(
  'python3: PyQt bindings'
)
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

#  cd "$srcdir/$_pkgname"/pyqt
#  CXXFLAGS="-I$PWD/../lib -I$PWD/../../build/lib" LDFLAGS="-L$PWD/../../build" sip-wheel --verbose --qmake /usr/bin/qmake6
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_pkgname/README.md" -t "$pkgdir"/usr/share/licenses/$pkgname

#  cd "$srcdir/$_pkgname"/pyqt
#  python -m installer --destdir="$pkgdir" *.whl
}
