# debian-setup
This is my setup script after a fresh Debian/Ubuntu install, mainly for Git, Zsh
and RVM.

## files

* `suggested.sh`: Suggested settings after a fresh install.
* `rails.sh`: Suggested settings after installing RVM, Ruby and RubyGems. It
  includes setting for IRB and RSpec.
* `suggested/`: Auxiliary files for `suggested.sh`.
* `optional/`: Optional settings.
* `install.sh`: Script to be run online before installing Git.

## install

`wget https://raw.githubusercontent.com/franklinyu/debian-setup/master/install.sh -O - | sh`

## dependencies

* `sudo` (not installed in fresh Debian)

## note

* RVM currently requires Zsh 5 which is only default after Ubuntu 14.04 or
  Debian 8.
