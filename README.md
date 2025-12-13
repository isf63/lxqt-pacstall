# lxqt-pacstall

#### Prerequisites

- Pacstall: https://pacstall.dev/

#### Installation

`git clone https://github.com/isf63/lxqt-pacstall`

#### Usage

- To build and install all git packages, run `./install.sh all`.
- To build and install only individual packages run, e.g., `./install.sh lximage-qt-git`.
  - **Note:** Installing individual packages may fail as the packages depend on each other. Refer to the build order here: https://github.com/lxqt/lxqt/wiki/Building-from-source#compiling .

- To update all installed packages to their latest commits, run `./update.sh`.

- To clean all build files (except for PKGBUILDs), run `./clean.sh`.
  - To remove unneeded make dependencies, run `apt autopurge`.

#### TODO
- Re-add PyQt6 bindings to QTermWidget

### Has only been tested on and is recommended for recent releases of Ubuntu and Debian.
