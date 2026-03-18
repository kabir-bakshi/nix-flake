{config, pkgs, ...}:
{
	home.username = "kabir";
	home.homeDirectory = "/home/kabir";
	home.stateVersion = "25.11";
	programs = {
		bash = {
			enable = true;
			shellAliases = {
				crclone="sh ~/Documents/rclone\ sync.sh";
				
				editconf="nano ~/nix-flake/configuration.nix";
				editflake="nano ~/nix-flake/flake.nix";

				nrs="sudo nixos-rebuild switch --impure --flake ~/nix-flake/";
				nfu="nix flake update --flake ~/nix-flake/ && nrs";

				smcs="cd /home/kabir/Documents/Sync\ Sewer && sh start.sh";

			};
		};
	};
	
	
	
}
