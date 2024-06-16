{ pkgs, ... }:

{
  programs.neovim = rec {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withRuby = false;
    withPython3 = false;
    withNodeJs = false;

    plugins = with pkgs.vimPlugins; [
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

      mini-nvim
      nvim-notify
      gitsigns-nvim
      vim-fugitive
      oil-nvim
      nvim-surround
      telescope-nvim
      comment-nvim

      (pkgs.vimUtils.buildVimPlugin {
        pname = "vim-moonfly-colors";
        version = "master";
        src = pkgs.fetchFromGitHub {
          owner = "bluz71";
          repo = "vim-moonfly-colors";
          rev = "master";
          hash = "sha256-iS18dNQu/6o0gyFMN6Sd74+YGyW7q3y0nafNHotP0p0=";
        };
      })

      (pkgs.vimUtils.buildVimPlugin {
        pname = "nvim-config";
        version = "#";
        src = ./.;
      })
    ];

    extraPackages = with pkgs; [
      lua-language-server
      python311Packages.python-lsp-server
      gopls
    ];
  };
}
