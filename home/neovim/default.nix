{ pkgs, ... }:

let
  fidget-nvim-legacy = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "fidget-nvim-legacy";
    src = pkgs.fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "90c22e47be057562ee9566bad313ad42d622c1d3";
      hash = "sha256-N3O/AvsD6Ckd62kDEN4z/K5A3SZNR15DnQeZhH6/Rr0=";
    };
  };

  lsp-zero-nvim-v2 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "lsp-zero-nvim-v2";
    src = pkgs.fetchFromGitHub {
      owner = "VonHeikemen";
      repo = "lsp-zero.nvim";
      rev = "v2.x";
      hash = "sha256-hBDkb4KYkuhI7Vv5UUtdLUPechCt40UxUSRr3eZqHG8=";
    };
  };

  hardtime-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "hardtime-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "m4xshen";
      repo = "hardtime.nvim";
      rev = "main"; # cringe
      hash = "sha256-meOoSbZJclLJr1ij6FAOjCyINHd9tTVnYmfED6NIDfc=";
    };
  };
in {
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
        tree-sitter-vimdoc
        tree-sitter-css
        tree-sitter-html
        tree-sitter-nix
        tree-sitter-markdown
        tree-sitter-cpp
      ]))
      nvim-treesitter-textobjects
      nvim-treesitter-context

      nvim-lspconfig
      # fidget-nvim
      fidget-nvim-legacy
      lsp-zero-nvim-v2

      comment-nvim
      indent-blankline-nvim
      nvim-autopairs
      nvim-notify
      nvim-surround
      which-key-nvim
      mini-nvim
      toggleterm-nvim
      gitsigns-nvim
      neovim-ayu
      vim-fugitive
      vim-nix
      hardtime-nvim
      oil-nvim
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
          "treesitter"
          "telescope"
          "which-key"
          "other"
        ]);
    in ''
      vim.g.mapleader = " "

      ${luaConfig}
      ${luaPluginConfig}

      -- :source $VIMRUNTIME/syntax/hitest.vim
      require('ayu').setup({
        overrides = {
          CursorLine = { bg = "#111111" },
          Normal = { bg = "None" },
          NormalFloat = { bg = "None" },
          ColorColumn = { bg = "None" },
          SignColumn = { bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          CursorLineNr = { bg = "None" },
          CursorColumn = { bg = "None" },
          WhichKeyFloat = { bg = "None" },
          VertSplit = { bg = "None" },
          StatusLine = { bg = "None" },
        },
      })
      vim.cmd.colorscheme("ayu-dark")
      vim.opt.cursorline = true

      -- these all just use defaults so they
      -- don't end up needing their own files
      require("hardtime").setup()
      require("oil").setup()
      require("nvim-surround").setup()
      require('mini.indentscope').setup()
      require('mini.ai').setup()
      require('gitsigns').setup()
      require('fidget').setup()
      require('Comment').setup()
        '';
  };
}
