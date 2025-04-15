# lxqt-pacstall

### Is only recommended for Ubuntu ≥ 25.04 and Debian ≥ 13.0

#### Prerequisites

- Pacstall: https://pacstall.dev/
- Cmake

#### Usage

- Build and install all LXQt git packages: `./install.sh all`

- Build and install only individual packages: e.g. `./install.sh lximage-qt-git qps-git`, `./install.sh lxqt-admin-git`

  Note: Installing individual packages may fail as the packages depend on each other. See the build order here: https://github.com/lxqt/lxqt/wiki/Building-from-source#compiling

- Update all installed packages to the most recent commits: `./update.sh`

- Remove leftover and unneeded make dependencies: `apt autopurge`

#### TODO
- Re-add PyQt6 bindings to qtermwidget
- Re-add check() to libdbusmenu-lxqt
