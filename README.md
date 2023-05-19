# Dotfiles

Managed by [GNU Stow](https://www.gnu.org/software/stow/).

Make sure this directory is cloned into `$HOME` before using stow.

## Add config

```
$ stow <config name>
```

## Delete config

```
$ stow -D <config name>
```

It really is just that simple.

# Problems

- literally only lets configs be usable
- does not really install anything unless the `manage` script is used which is made for arch linux only; not ideal.
