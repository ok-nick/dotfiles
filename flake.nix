{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
    nixpkgs-untested.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    # hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib.url = "github:hyprwm/contrib";
    # xdg-desktop-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    helix.url = "github:helix-editor/helix";

    # https://github.com/phush0/razer-laptop-control-no-dkms/pull/30
    razer-laptop-control.url = "github:ok-nick/razer-laptop-control-no-dkms";

    fenix.url = "github:nix-community/fenix";

    nixd.url = "github:nix-community/nixd";

    typst-lsp.url = "github:nvarner/typst-lsp";

    sops-nix.url = "github:Mic92/sops-nix";

    # fufexan.url = "github:fufexan/dotfiles";
    # gross.url = "github:fufexan/gross";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosModules = import ./modules/nixos;
    nixDarwinModules = import ./modules/nix-darwin;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      icarus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/nixos/icarus];
      };
    };

    darwinConfigurations = {
      mapro = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs outputs;};
        system = "aarch64-darwin";
        modules = [./hosts/nix-darwin/mapro];
      };
    };

    homeConfigurations = {
      "nicky@icarus" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs outputs;};
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./home/nicky/icarus.nix];
      };
      "nicky@mapro" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs outputs;};
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [./home/nicky/mapro.nix];
      };
    };
  };
}
