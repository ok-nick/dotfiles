{pkgs, ...}: {
  programs = {
    java.enable = true;
    zoxide.enable = true;
  };

  home.packages = with pkgs;
    [
      # cli tools
      gnumake
      # python311Packages.jupyter
      sqlx-cli
      # cargo-shuttle
      unzip
      zip
      fzf
      tree-sitter
      # postman
      ripgrep
      fd
      jetbrains.idea-community
      thefuck

      # misc
      vscode-langservers-extracted # many lsps
      efm-langserver # generic lsp
      lldb # debugger

      # C/C++
      gcc # compiler
      clang-tools # compiler/formatter/etc.

      # typst
      typst # compiler
      typst-lsp # lsp
      typst-fmt # formatter

      # lua
      lua-language-server # lsp
      # TODO: luau-lsp
      selene # linter
      stylua # formatter

      # typescript/javascript
      nodejs # compiler
      nodePackages_latest.typescript-language-server # lsp
      nodePackages_latest.eslint_d # linter
      nodePackages_latest.prettier # formatter

      # c#
      omnisharp-roslyn # lsp

      # python
      nodePackages_latest.pyright # lsp
      # black # formatter
      ruff-lsp # linter/formatter
      # ruff # linter/formatter
      python311 # compiler
      python311Packages.pip # package manager

      # java
      jdt-language-server # lsp

      # json
      nodePackages_latest.vscode-json-languageserver # lsp
      # jsonls

      # yaml
      yaml-language-server # lsp
      # yamllint # linter

      # bash
      nodePackages_latest.bash-language-server # lsp

      # prose
      # nodePackages_latest.grammarly-languageserver

      # nix
      # inputs.nixd.packages.${pkgs.hostPlatform.system}.default # lsp
      nil # lsp
      statix # linter
      alejandra # formatter
      deadnix # linter

      # markdown
      taplo # lsp
      # marksman # lsp
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      # misc
      gdb # debugger
      # cudaPackages.cudatoolkit
      # insomnia
    ];
}
