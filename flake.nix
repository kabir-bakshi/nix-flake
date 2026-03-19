{
	description = "Lenovo m720q Flake for Kabir";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

		nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		stylix.url = "github:nix-community/stylix/release-25.11";
	};

	outputs = { nixpkgs, nixpkgs-unstable, nix-flatpak, home-manager, ... } @ inputs: {
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";

				specialArgs = { inherit inputs; };
				
				modules = [
					./configuration.nix
					
					nix-flatpak.nixosModules.nix-flatpak
					
					home-manager.nixosModules.home-manager
					{
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							backupFileExtension = "nix_backup";
							
							users.kabir = ./kabir_home.nix;
						};
					}
					
					inputs.stylix.nixosModules.stylix
				];
			};
		};
	};
}
