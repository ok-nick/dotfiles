{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    # defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      plenary-nvim

      comment-nvim
      nvim-surround
      vim-sleuth

      vim-fugitive
      gitsigns-nvim

      indent-blankline-nvim
      kanagawa-nvim
      vim-hardtime

      vim-suda
      zen-mode-nvim
      # vim-markdown-composer

      telescope-nvim
      telescope-fzf-native-nvim

      null-ls-nvim
      nvim-lspconfig
      rust-tools-nvim
      typst-vim
      nvim-jdtls # TODO: set this up in lua
      fidget-nvim
      SchemaStore-nvim
      luasnip

      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-nvim-lsp-signature-help
      cmp-npm
      crates-nvim

      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
    ];

    # extraLuaConfig = ''
    #   require("${./nvim/init.lua}")
    # '';
  };

  xdg.configFile.nvim = {
    source = ./nvim;
    recursive = true;
  };
}
