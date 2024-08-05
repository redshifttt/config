{ pkgs, ... }:

let
  inherit (pkgs.vimUtils) buildVimPlugin;
  inherit (pkgs) fetchFromGitHub;

  inherit (builtins) attrValues;

  inherit (pkgs.vimPlugins) nvim-treesitter;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withRuby = false;
    withPython3 = false;
    withNodeJs = false;

    plugins = attrValues {
      inherit (pkgs.vimPlugins)
      nvim-cmp
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline

      luasnip
      cmp_luasnip

      nvim-lspconfig
      fidget-nvim
      lsp-zero-nvim

      mini-nvim
      nvim-notify
      gitsigns-nvim
      vim-fugitive
      oil-nvim
      nvim-surround
      telescope-nvim
      neoformat
      nvim-highlight-colors
      noice-nvim
      nui-nvim
      friendly-snippets
      lspkind-nvim
      nvim-web-devicons
      ;

      treesitter = nvim-treesitter.withPlugins (p: with p; [
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
      ]);

      vim-moonfly-colors = buildVimPlugin {
        pname = "vim-moonfly-colors";
        version = "master";
        src = fetchFromGitHub {
          owner = "bluz71";
          repo = "vim-moonfly-colors";
          rev = "master";
          hash = "sha256-F2U8QgkMoUyQVifUFKmAO1TT8chAIh0GWkHgCsSqU4A=";
        };
      };

      config = buildVimPlugin {
        pname = "nvim-config";
        version = "#";
        src = ./.;
      };
    };

    extraPackages = with pkgs; [
      lua-language-server
      python311Packages.python-lsp-server
      gopls
    ];
  };
}
