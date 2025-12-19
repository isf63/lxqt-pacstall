#!/usr/bin/env bash

is_installed() {
	dpkg -l "$1" 1>/dev/null 2>/dev/null
}

local_version() {
	apt-cache policy "$1" | grep "Installed" | sed "s/  Installed: //g"
}

local_hash() {
	echo "$1" | sed 's/.*\..//; s/..$//'
}

remote_hash() {
	git ls-remote "https://github.com/lxqt/${1//-git/}" | head -1 | cut -f 1
	if [[ $? != 0 ]]; then
		exit
	fi
}

[[ "$PWD" = */lxqt-pacstall ]] || exit 1

for pkg in pacscript/*; do

	_pkgname="$(basename ${pkg//.pacscript})"

	if ! is_installed "$_pkgname"; then
		echo -e "[NOT INSTALLED]\t$_pkgname"
		continue
	fi

	_local_ver="$(local_version $_pkgname)"
	_local_hash="$(local_hash $_local_ver)"
	_remote_hash="-pacstall1~git$(remote_hash $_pkgname)"

	if [[ "$_remote_hash" == "$_local_hash"* ]]; then
		echo -e "[UP-TO-DATE]\t$_pkgname"
	else
		echo -e "[UPDATING]\t$_pkgname\t($_local_ver -> ${_remote_hash:0:8})"

		find "$pkg" -maxdepth 1 ! -wholename "$pkg" ! -name "PKGBUILD" -exec sudo rm -rf {} +
		./install.sh "$_pkgname"
		if [[ $? != 0 ]]; then
			exit
		fi
	fi
done
