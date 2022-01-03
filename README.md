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
- [Spotify](https://spotify.com) music for reaching the coding flow

## Usage

```
git clone https://github.com/legetz/salesforce-dev-arch.git
salesforce-dev-arch/install.sh
```

You can safely run installer multiple times. This is handy when for example Salesforce releases newer `sfdx` CLI versions.

## Pre-requirements

Script will work in any Arch-based distro which has following setted up:
- `pacman` package manager
- `git` version control

A) Option for Arch Linux gurus

- You can install [Arch Linux](https://www.archlinux.org/) from scratch
- Install your preferred desktop environment (XFCE/KDE/GNOME/etc)

B) Option for people favouring installation wizard

- [Manjaro](https://manjaro.org/) offers following editions
  - [XFCE](https://manjaro.org/downloads/official/xfce/)
  - [KDE](https://manjaro.org/downloads/official/kde/)
  - [GNOME](https://manjaro.org/downloads/official/gnome/)
- Download and install minimal version

## Extra tips

### Swap partition

Enable swap partition by executing these steps:
* Locate your swap partition name: `sudo lsblk`
* Activate swap (assuming your partition name being /dev/sda3): `sudo swapon /dev/sda3`
* Enable swap automatically on boot: `sudo bash -c "echo UUID=$(lsblk -no UUID /dev/sda3) none swap defaults 0 0 >> /etc/fstab"`