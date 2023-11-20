{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-untested.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib.url = "github:hyprwm/contrib";
    xdg-desktop-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    helix.url = "github:helix-editor/helix";

    # https://github.com/phush0/razer-laptop-control-no-dkms/pull/30
    razer-laptop-control.url = "github:ok-nick/razer-laptop-control-no-dkms";

    fenix.url = "github:nix-community/fenix";

    nixd.url = "github:nix-community/nixd";

    typst-lsp.url = "github:nvarner/typst-lsp";

    sops-nix.url = "github:Mic92/sops-nix";

    yap-my-classes.url = "git+file:///persist/temp/ubh-fall2022-repotemplate-ok-nick";

    # fufexan.url = "github:fufexan/dotfiles";
    # gross.url = "github:fufexan/gross";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      icarus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/icarus];
      };
    };

    homeConfigurations = {
      "nicky@icarus" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs outputs;};
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./home/nicky/icarus.nix];
      };
    };
  };
}
