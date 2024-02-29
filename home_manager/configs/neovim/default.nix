{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
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
        tree-sitter-python
        tree-sitter-bash
        tree-sitter-vim
        tree-sitter-vimdoc
        tree-sitter-css
        tree-sitter-html
        tree-sitter-nix
        tree-sitter-markdown
        tree-sitter-go
      ]))
      nvim-treesitter-context

      nvim-lspconfig
      fidget-nvim
      lsp-zero-nvim

      mini-nvim
      nvim-notify
      gitsigns-nvim
      neovim-ayu
      vim-fugitive
      oil-nvim
      vim-be-good
      indent-blankline-nvim
      nvim-surround
      telescope-nvim
      comment-nvim
    ];

    extraPackages = with pkgs; [
      # I cannot be arsed doing it per-project
      # TODO: make templates for the languages
      lua-language-server
      python311Packages.python-lsp-server
      gopls
    ];

    extraLuaConfig =
      let
        filesToLoad = [
          ./lua/set.lua
          ./lua/keys.lua
          ./lua/autocmd.lua

          ./lua/plugins/lsp.lua
          ./lua/plugins/telescope.lua
          ./lua/plugins/treesitter.lua
          ./lua/plugins/mini.lua

          ./lua/extra_config.lua
        ];

        configRequire = builtins.concatStringsSep "\n" (map (f: builtins.readFile f) filesToLoad);
      in ''
        ${configRequire}
      '';
  };
}
