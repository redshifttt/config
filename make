#!/bin/sh

hmswitch(){
    home-manager switch --flake .
}

nixrebuild(){
    nixos-rebuild switch --flake . --use-remote-sudo
}

fullswitch(){
    hmswitch
    nixrebuild
}

update(){
    nix flake update --commit-lock-file
    fullswitch
    nvd diff /run/booted-system /run/current-system
}

case "$1" in
    "hmswitch") hmswitch ;;
    "nixrebuild") nixrebuild ;;
    "fullswitch") fullswitch ;;
    "update") update ;;
    *)
        printf "make < hmswitch | nixrebuild | fullswitch | update >\n\n"
        printf "hmswitch - home manager switch\nnixrebuild - nixos-rebuild switch\nfullswitch - hmswitch + nixrebuild\nupdate - commit lock file + hmswitch + nixrebuild\n"
    ;;
esac
