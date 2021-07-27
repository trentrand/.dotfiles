# .dotfiles

> 📐 Precise configurations for a command-line development environment

I love tinkering with development tools.

Within my dotfiles you'll find dozens of meaningfully selected settings, utilities and workflows improvements.
Take a look and see if you find something helpful!

## Installing on your system

Clone the repository into your user home directory and clone its contents:

```bash
$ git clone --bare --recursive https://github.com/trentrand/.dotfiles ~/.dotfiles
$ alias dotfiles_command='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ dotfiles_command checkout
```

Next run the install script to add `dotfiles` executable to your path.

```bash
$ ~/.dotfiles/install.sh
```

This executable is used to interact with the dotfiles manager globally.
See the section on usage below.

The install script will also fetch dependencies by using git submodules and package managers.
