{
  description = "Lenovo m720q Flake for Kabir";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

		nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
			url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = { nixpkgs, nixpkgs-unstable, nix-flatpak, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem { # Where "nixos" (written after "nixosConfigurations") is my hostname.
      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix
				inputs.home-manager.nixosModules.default
				nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}
