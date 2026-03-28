{config, pkgs, ...}:
{
	home.username = "kabir";
	home.homeDirectory = "/home/kabir";
	
	programs = {
		bash = {
			enable = true;
  			initExtra = ''
				export PATH=$PATH:/usr/bin 
			'';
			shellAliases = {
				crclone="sh ~/Documents/rclone\\ sync.sh";
				
				editconf="nvim ~/nix-flake/configuration.nix";
				editflake="nvim ~/nix-flake/flake.nix";

				nrs="sudo nixos-rebuild switch --impure --flake ~/nix-flake/";
				nfu="nix flake update --flake ~/nix-flake/ && nrs";

				smcs="cd ~/Documents/Sync\\ Sewer; sh start.sh";

			};
		};
	};
	

	home.stateVersion = "25.11";
}
