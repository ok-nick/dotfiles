{pkgs, ...}: {
  programs = {
    java.enable = true;
    zoxide.enable = true;
  };

  home.packages = with pkgs;
    [
      # cli tools
      gnumake
      cargo-binstall
      # cargo-cross
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
      # jetbrains.idea-community
      thefuck

      # misc
      vscode-langservers-extracted # many lsps
      efm-langserver # generic lsp
      lldb # debugger

      # C/C++
      # gcc # compiler
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
      typescript-language-server # lsp
      eslint_d # linter
      nodePackages_latest.prettier # formatter

      # c#
      omnisharp-roslyn # lsp

      # python
      pyright # lsp
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
      bash-language-server # lsp

      # prose
      # nodePackages_latest.grammarly-languageserver # lsp

      # nix
      # inputs.nixd.packages.${pkgs.hostPlatform.system}.default # lsp
      nil # lsp
      statix # linter
      alejandra # formatter
      deadnix # linter

      # markdown
      taplo # lsp
      # marksman # lsp

      # verilog
      svls # lsp
      svlint # linter
      verilog # compiler
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      # misc
      gdb # debugger
      # cudaPackages.cudatoolkit
      # insomnia

      # verilog
      verible # lsp/linter/formatter/etc.
    ];
}
