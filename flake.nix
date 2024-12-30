{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-untested.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    # hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib.url = "github:hyprwm/contrib";
    helix.url = "github:helix-editor/helix";
    razer-laptop-control.url = "github:Razer-Linux/razer-laptop-control-no-dkms";
    fenix.url = "github:nix-community/fenix";
    nixd.url = "github:nix-community/nixd";
    sops-nix.url = "github:Mic92/sops-nix";
    # fufexan.url = "github:fufexan/dotfiles";
    # gross.url = "github:fufexan/gross";
    mac-app-util.url = "github:hraban/mac-app-util";
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

    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      icarus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/nixos/icarus];
      };
      isotope = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/nixos/isotope];
      };
    };

    darwinConfigurations = {
      mapro = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs outputs;};
        system = "aarch64-darwin";
        modules = [./hosts/nix-darwin/mapro];
      };
      dob = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs outputs;};
        system = "aarch64-darwin";
        modules = [./hosts/nix-darwin/dob];
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
      "nicky@isotope" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs outputs;};
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        modules = [./home/nicky/isotope.nix];
      };
      "nicky@dob" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs outputs;};
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [./home/nicky/dob.nix];
      };
    };

    # TODO: make function to auto create this
    # also, read github ci for why home manager configs are commented
    checks = {
      aarch64-darwin = {
        "mapro" = self.darwinConfigurations.mapro.system;
        "dob" = self.darwinConfigurations.mapro.system;

        # "nicky@mapro" = self.homeConfigurations."nicky@mapro".activationPackage;
      };
      x86_64-linux = {
        # nixos configs are checked by default

        # "nicky@icarus" = self.homeConfigurations."nicky@icarus".activationPackage;
      };
    };
  };
}
