# lxqt-pacstall

#### Prerequisites

- Pacstall: https://pacstall.dev/
- Cmake

#### Installation

- `git clone https://github.com/isf63/lxqt-pacstall`

#### Usage

- Build and install all LXQt git packages: `./install.sh all`
- Build and install only individual packages: e.g. `./install.sh lximage-qt-git`, `./install.sh lxqt-admin-git`

  **Note:** Installing individual packages may fail as the packages depend on each other. Refer to the build order here: https://github.com/lxqt/lxqt/wiki/Building-from-source#compiling

- Update all installed packages to the latest commits: `./update.sh`

- Remove leftover and unneeded make dependencies: `apt autopurge`

#### TODO
- Re-add PyQt6 bindings to qtermwidget
- Re-add check() to libdbusmenu-lxqt

---

### Is only recommended for recent releases of Ubuntu (≥ 25.04) and Debian (≥ 13.0)
