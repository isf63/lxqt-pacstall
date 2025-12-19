#!/usr/bin/env bash

makedeb_install() {
	cd ./pacscript/ || exit 1
	pacstall -IP "$1".pacscript
	if [[ $? != 0 ]]; then
		cd -
		exit 1
	fi
	cd -
}

# Install order: https://github.com/lxqt/lxqt/wiki/Building-from-source#compiling
makedeb_install_all() {
	makedeb_install lxqt-build-tools-git
	makedeb_install libdbusmenu-lxqt-git
####
	makedeb_install libqtxdg-git
	makedeb_install lxqt-menu-data-git
####
	makedeb_install liblxqt-git
	makedeb_install libsysstat-git
	makedeb_install qtxdg-tools-git
	makedeb_install libfm-qt-git
####
	makedeb_install lxqt-globalkeys-git
	makedeb_install lxqt-qtplugin-git
	makedeb_install qtermwidget-git
####
	makedeb_install lxqt-panel-git
	makedeb_install pcmanfm-qt-git
	makedeb_install qterminal-git
	makedeb_install lxqt-powermanagement-git
	makedeb_install lxqt-runner-git
	makedeb_install lxqt-themes-git
	makedeb_install lxqt-admin-git
	makedeb_install lxqt-notificationd-git
	makedeb_install lxqt-about-git
	makedeb_install lxqt-config-git
	makedeb_install lxqt-policykit-git
	makedeb_install lxqt-sudo-git
	makedeb_install lxqt-openssh-askpass-git
	makedeb_install lxqt-session-git
	makedeb_install lxqt-wayland-session-git
	makedeb_install pavucontrol-qt-git
	makedeb_install xdg-desktop-portal-lxqt-git
	makedeb_install lxqt-archiver-git
	makedeb_install screengrab-git
	makedeb_install lximage-qt-git
}

[[ "$PWD" = */lxqt-pacstall ]] || exit 1

for arg in "$@"; do
	if [[ $arg == "all" ]]; then
		makedeb_install_all
		exit
	fi
done

for arg in "$@"; do
	makedeb_install "$arg"
done
