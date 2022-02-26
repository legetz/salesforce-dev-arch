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
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) to make you feel like 10x developer in CLI
- [Docker](https://www.docker.com/) container support
- `yay` package manager
- meld for file/directory comparisons
- [Spotify](https://spotify.com) music for reaching the coding flow
- Development related to AWS/Azure/GCP
  - [Serverless](https://www.serverless.com/) for Lambda deployments
  - [Terraform](https://www.terraform.io/) for infrastructure as code

## Aliases
Installer will add bunch of handy aliases/functions to speed up your Force.com CLI development.

Here are the most important ones:
- `org-connect-sandbox ORG-NAME` and `org-connect-production ORG-NAME` let's you quickly connect to new org
- `org-open ORG-NAME` opens the org
- `metadata-retrieve ORG-NAME` fetches the metadata using package.xml and unzips the results
- `sfdx-retrieve ORG-NAME` fetches the metadata using `manifest/package.xml` into SFDX formatted project structure
- `metadata-deploy ORG-NAME` deploys unpackaged.zip and runs all local tests in an org, `metadata-validate ORG-NAME` only validates the same
- `metadata-deploy-specified-tests SomeTestClass ORG-NAME` deploys unpackaged.zip and runs given tests in an org
- `metadata-quick-deploy ORG-NAME` deploys unpackaged.zip and skips the tests. Handy for quick sandbox deployments
- `org-limits ORG-NAME` shows various org limits

Check all aliases and functions at `src/aliases.sh`

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