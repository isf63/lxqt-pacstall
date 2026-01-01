#!/usr/bin/env bash

pacstall_install() {
	pacstall -I --disable-prompts pacscript/"$1".pacscript || exit 1
	# may still not exit upon errors
}

# Install order: https://github.com/lxqt/lxqt/wiki/Building-from-source#compiling
pacstall_install_all() {
	pacstall_install lxqt-build-tools-git
	pacstall_install libdbusmenu-lxqt-git
####
	pacstall_install libqtxdg-git
	pacstall_install lxqt-menu-data-git
####
	pacstall_install liblxqt-git
	pacstall_install libsysstat-git
	pacstall_install qtxdg-tools-git
	pacstall_install libfm-qt-git
####
	pacstall_install lxqt-globalkeys-git
	pacstall_install lxqt-qtplugin-git
	pacstall_install qtermwidget-git
####
	pacstall_install lxqt-panel-git
	pacstall_install pcmanfm-qt-git
	pacstall_install qterminal-git
	pacstall_install lxqt-powermanagement-git
	pacstall_install lxqt-runner-git
	pacstall_install lxqt-themes-git
	pacstall_install lxqt-admin-git
	pacstall_install lxqt-notificationd-git
	pacstall_install lxqt-about-git
	pacstall_install lxqt-config-git
	pacstall_install lxqt-policykit-git
	pacstall_install lxqt-sudo-git
	pacstall_install lxqt-openssh-askpass-git
	pacstall_install lxqt-session-git
	pacstall_install lxqt-wayland-session-git
	pacstall_install pavucontrol-qt-git
	pacstall_install xdg-desktop-portal-lxqt-git
	pacstall_install lxqt-archiver-git
	pacstall_install screengrab-git
	pacstall_install lximage-qt-git
}

[[ "$PWD" = */lxqt-pacstall ]] || exit 1

for arg in "$@"; do
	if [[ $arg == "all" ]]; then
		pacstall_install_all
		exit
	fi
done

for arg in "$@"; do
	pacstall_install "$arg"
done
