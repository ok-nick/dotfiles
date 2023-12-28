{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    java.enable = true;
    zoxide.enable = true;
  };

  home.packages = with pkgs;
    [
      maven
      gnumake
      inputs.nixd.packages.${pkgs.hostPlatform.system}.default
      python311Packages.jupyter # TODO: temp
      sqlx-cli
      cargo-shuttle
      unzip
      zip
      fzf
      tree-sitter
      typst
      # postman
      ripgrep
      fd
      jetbrains.idea-community
      thefuck

      efm-langserver
      nodejs
      gcc
      python311
      python311Packages.pip
      ruff
      ruff-lsp
      # inputs.typst-lsp.packages.${pkgs.hostPlatform.system}.default
      typst-lsp
      typst-fmt
      lldb
      lua-language-server
      selene
      stylua
      # TODO: luau-lsp
      nodePackages_latest.eslint_d
      nodePackages_latest.prettier
      nodePackages_latest.typescript-language-server
      # clang-tools # outdated
      clang-tools_16
      omnisharp-roslyn
      nodePackages_latest.pyright
      black
      jdt-language-server
      taplo
      # jsonls
      yaml-language-server
      nodePackages_latest.vscode-json-languageserver
      # yamllint
      nodePackages_latest.bash-language-server
      nodePackages_latest.grammarly-languageserver
      nil
      statix
      alejandra
      deadnix
      marksman
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      gdb
      cudaPackages.cudatoolkit
      insomnia
    ];
}
