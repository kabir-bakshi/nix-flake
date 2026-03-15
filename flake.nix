{
  description = "Lenovo m720q Flake for Kabir";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager.url = "github:nixos-community/home-manager";
    #   home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem { # Where "nixos" is my hostname.
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };

  };
}
