#/usr/bin/env bash

[[ "$PWD" = */lxqt-pacstall ]] || exit 1

# for pkg in ./pkgbuild/*; do
	# find "$pkg" -maxdepth 1 ! -wholename "$pkg" ! -name "PKGBUILD" -exec sudo rm -rf {} +
	# sed -i '/^pkgver=/ s/\.r.*$//' "$pkg"/PKGBUILD
# done
