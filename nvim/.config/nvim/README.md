# Installation for neovim config

## Requirements

- git
- patience

# What you gotta do

- Run `nvim` alone once. Packer will be cloned via git.
    - There will be an error for a plugin called notify. As you will see with treesitter in a second this is normal because it isn't installed yet.
- When it is done run `:PackerSync` from within neovim.
    - You'll get errors such as "TSUpdate does not exist." This is fine as treesitter is not installed yet.
- You will then see in the bottom-left some downloading and compiling going on. That is treesitter installed and downloading the languages I use. You can install additional languages with `:TSInstall <language>`.
- After this is done press `F5` to reload the config and the environment should be set up.
