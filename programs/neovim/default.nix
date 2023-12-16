{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      plenary-nvim # probably needed by something lol

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
      ]))
      nvim-treesitter-textobjects
      nvim-treesitter-context

      nvim-lspconfig
      fidget-nvim
      lsp-zero-nvim

      mini-nvim
      nvim-notify
      toggleterm-nvim
      gitsigns-nvim
      neovim-ayu
      vim-fugitive
      oil-nvim
      vim-be-good
      fzf-lua
      hardtime-nvim
    ];

    extraPackages = with pkgs; [
      lua-language-server # need to have the lsp for the lua config
    ];

    extraLuaConfig =
      let
        luaConfigRequire = config:
          builtins.readFile (builtins.toString ./lua + "/${config}.lua");

        luaPluginRequire = plugin:
          builtins.readFile (builtins.toString ./lua/plugins + "/${plugin}.lua");

        luaConfig = builtins.concatStringsSep "\n" (map luaConfigRequire [ "set" "autocmd" "keys" ]);

        luaPluginConfig = builtins.concatStringsSep "\n" (map luaPluginRequire [ "lsp" "treesitter" "fzf" "mini" "other" ]);
      in ''
        vim.g.mapleader = " "

        ${luaConfig}
        ${luaPluginConfig}

        -- :source $VIMRUNTIME/syntax/hitest.vim
        require('ayu').setup({
          overrides = {
            CursorLine = { bg = "#111111" },
            VertSplit = { fg = "#050505" },
            TabLineSel = { bg = "#050505" },
            NormalBorder = { fg = "#050505" },

            Normal = { bg = "None" },
            NormalFloat = { bg = "None" },
            ColorColumn = { bg = "None" },
            SignColumn = { bg = "None" },
            Folded = { bg = "None" },
            FoldColumn = { bg = "None" },
            CursorLineNr = { bg = "None" },
            CursorColumn = { bg = "None" },
            WhichKeyFloat = { bg = "None" },
            StatusLine = { bg = "None" },
            TabLine = { bg = "None" },

            MiniCursorword = { bg = "#151515", underline = true },
            MiniCursorwordCurrent = { bg = "#111111", underline = true },
            NotifyBackground = { bg = "#111111" },
          },
        })
        vim.cmd.colorscheme("ayu-dark")
        vim.opt.cursorline = true
        vim.loader.enable()

        vim.notify = require("notify")

        require("notify").setup({
          icons = {
            DEBUG = "[DEBUG]",
            ERROR = "[ERROR]",
            INFO = "[INFO]",
            TRACE = "[TRACE]",
            WARN = "[WARN]"
          },
          stages = "static",
          render = "compact",
        })

        require("hardtime").setup({
          max_count = 5
        })

        -- these all just use defaults so they don't end up needing their own files
        require("oil").setup()
        require('gitsigns').setup()
        require('fidget').setup()

        vim.g.ft_man_folding_enable = true
      '';
  };
}
