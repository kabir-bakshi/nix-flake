{
  description = "Lenovo m720q Flake for Kabir";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nixos-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux
  in {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        /etc/nixos/configuration.nix
      ];
    };

  };
}
