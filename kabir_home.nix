{config, pkgs, ...}:
{
	home.username = "kabir";
	home.homeDirectory = "/home/kabir";
	
	programs = {
		bash = {
			enable = true;
  			initExtra = ''
				export PATH=$PATH:/usr/bin 
			  
        echo 󰥳 गं गणपतये नमः।

        source ~/git-prompt.sh
        PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\n\[\e[2m\]╭── \[\e[1;3m\]\[\e[0m\] \[\e[1;2;3m\]\u\[\e[0m\]  \n\[\e[2m\]├── \[\e[1;3m\]\[\e[0m\] \[\e[1;2;3m\]\H\n\[\e[0;2m\]├── \[\e[1;3m\]\[\e[0m\] \[\e[1;2;3m\]\w\[\e[38;5;230m\]$PS1_CMD1\n\[\e[0;2m\]│\n│\n\[\e[0m\]\[\e[1;2m\]╰── 󰥳 \[\e[0m\]'
      '';
			shellAliases = {
        la="ls -al";
        
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
