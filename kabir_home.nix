{config, pkgs, ...}:
{
	home.username = "kabir";
	home.homeDirectory = "/home/kabir";
	
	programs = {
		bash = {
			enable = true;
			initExtra = ''
				echo
			'';
			shellAliases = {
				crclone="sh ~/Documents/rclone\\ sync.sh";
				
				editconf="vim ~/nix-flake/configuration.nix";
				editflake="vim ~/nix-flake/flake.nix";

				nrs="sudo nixos-rebuild switch --impure --flake ~/nix-flake/";
				nfu="nix flake update --flake ~/nix-flake/ && nrs";

				smcs="cd ~/Documents/Sync\\ Sewer; sh start.sh";

			};
		};
	};
	

	home.stateVersion = "25.11";
}
