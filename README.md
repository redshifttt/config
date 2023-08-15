# Nix/NixOS Configuration

This is my Nix/NixOS configuration.

Currently only have a single configuration for my PC (vesta) but will expand eventually.

## Directories

- [flake.nix](flake.nix) -- Entry point.
- [bin](bin/) -- custom shell scripts.
- [home](home/) -- home environment. individual program configs in directories below this.
- [hosts](hosts/) -- all hosts this config runs on
- [packages](packages/) -- custom nix packages

## Goals

My goal for my configs is functionality then form. I want to try and build the
best habits with the best tools for what I need. That means however everything
has to be optimized for *my* mind and no one elses. :)

## Acknowledgements

Configs I *borrowed* from:

- [max/config](https://git.privatevoid.net/max/config)
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)
- [MatthewCroughan/nixcfg](https://github.com/MatthewCroughan/nixcfg)
