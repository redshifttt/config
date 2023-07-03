{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      plenary-nvim # dependency of a lot of plugins including telescope
      telescope-nvim

      nvim-cmp
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-rg
      cmp_luasnip
      luasnip

      (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars)) # eventually replace with individual grammars
      nvim-treesitter-textobjects
      nvim-treesitter-context

      nvim-lspconfig
      # fidget-nvim

      glow-nvim
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
      onedarkpro-nvim
    ];

    extraPackages = with pkgs; [
        lua-language-server # need to have the lsp for the lua config
    ];

    extraLuaConfig = let
      luaConfigRequire = config: builtins.readFile (builtins.toString ./lua + "/${config}.lua");
      luaConfig = builtins.concatStringsSep "\n" (map luaConfigRequire [
        "set"
        "autocmd"
        "keys"
      ]);
      luaPluginRequire = plugin: builtins.readFile (builtins.toString ./lua/plugins + "/${plugin}.lua");
      luaPluginConfig = builtins.concatStringsSep "\n" (map luaPluginRequire [
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
      ${luaConfig}
      ${luaPluginConfig}

      vim.cmd.colorscheme("onedark_vivid")
      vim.g.lightline = { colorscheme = "one" }
      vim.opt.cursorline = true
    '';
  };
}
