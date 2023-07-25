{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      telescope-nvim
      plenary-nvim

      nvim-cmp
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-rg
      cmp_luasnip
      luasnip

      (nvim-treesitter.withPlugins (p: with p; [
        tree-sitter-lua
        tree-sitter-c
        tree-sitter-python
        tree-sitter-bash
        tree-sitter-vim
        tree-sitter-css
        tree-sitter-html
        tree-sitter-nix
      ]))
      nvim-treesitter-textobjects
      nvim-treesitter-context

      nvim-lspconfig
      # fidget-nvim

      comment-nvim
      lightline-vim
      indent-blankline-nvim
      nvim-autopairs
      nvim-notify
      nvim-surround
      which-key-nvim
      mini-nvim
      toggleterm-nvim
      gitsigns-nvim
      nvim-colorizer-lua
      neovim-ayu
    ];

    extraPackages = with pkgs; [
      lua-language-server # need to have the lsp for the lua config
    ];

    extraLuaConfig = let
      luaConfigRequire = config:
        builtins.readFile (builtins.toString ./lua + "/${config}.lua");

      luaPluginRequire = plugin:
        builtins.readFile (builtins.toString ./lua/plugins + "/${plugin}.lua");

      luaConfig =
        builtins.concatStringsSep "\n" (map luaConfigRequire [ "set" "autocmd" "keys" ]);

      luaPluginConfig =
        builtins.concatStringsSep "\n" (map luaPluginRequire [
          "lsp"
          "autopairs"
          "comment"
          # "fidget"
          "gitsigns"
          "indent-blankline"
          "telescope"
          "toggleterm"
          "treesitter"
          "which-key"
          "mini"
        ]);
    in ''
      vim.g.mapleader = " "

      ${luaConfig}
      ${luaPluginConfig}

      vim.cmd.colorscheme("ayu-dark")
      vim.g.lightline = { colorscheme = "ayu_dark" }
      vim.opt.cursorline = true
    '';
  };
}
