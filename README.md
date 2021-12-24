# salesforce-dev-arch

Install apps/packages related to Salesforce development using any Arch Linux based distro

## Apps/packages

Here are the most important ones listed:

- VSCode or IntelliJ Idea for your preferred IDE
- `sfdx` and `sf` CLI commands
- Firefox, Google Chrome
- Slack, Microsoft Teams
- Node.js stable and latest LTS
  - Uses `nvm` to have multiple Node.js versions installed
- Java 11 runtime
- [Docker](https://www.docker.com/) container support
- `yay` package manager
- meld for file/directory comparisons

## Usage

```
git clone https://github.com/legetz/salesforce-dev-arch.git
salesforce-dev-arch/install.sh
```

You can safely run installer multiple times. This is handy when for example Salesforce releases newer `sfdx` CLI versions.

## Pre-requirement

Script will work in any Arch-based distro which has `pacman` package manager available.

A) Option for Arch Linux gurus

- You can install [Arch Linux](https://www.archlinux.org/) from scratch
- Install your preferred desktop environment (XFCE/KDE/GNOME/etc)

B) Option for people favouring installation wizard

- [Manjaro](https://manjaro.org/) offers following editions
  - [XFCE](https://manjaro.org/downloads/official/xfce/)
  - [KDE](https://manjaro.org/downloads/official/kde/)
  - [GNOME](https://manjaro.org/downloads/official/gnome/)
- Download and install minimal version
