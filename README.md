# dotfiles
My personal dotfiles



Also used for installing and configuring a fresh Debian installation.

## Install new installation

Start with a base Debian OS.
No graphical environment is required to bootstrap machine.
Needed packages to be installed:
    - wget

All other needed packages will be handled by bootstrap code (aka install script)

```bash
wget -q -O- https://www.mauricekoster.com/install | bash
```
