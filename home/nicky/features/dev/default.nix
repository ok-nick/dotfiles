{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./bottom.nix
    ./broot.nix
    ./editorconfig.nix
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    ./helix.nix
    ./neovim
    ./starship.nix
    ./zsh.nix
    ./fish.nix
    ./fenix.nix
  ];

  programs = {
    java.enable = true;
    zoxide.enable = true;
  };

  home.packages = let
    untested-pkgs = with inputs.nixpkgs-untested.legacyPackages.x86_64-linux; [
      ruff
      ruff-lsp
    ];
  in
    with pkgs;
      [
        maven
        gdb
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
        insomnia
        # postman
        ripgrep
        fd
        jetbrains.idea-community
        thefuck
        cudaPackages.cudatoolkit

        efm-langserver
        nodejs
        gcc
        python311
        python311Packages.pip
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
      ++ untested-pkgs;
}
