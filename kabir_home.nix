{config, pkgs, ...}:
{
	home.username = "kabir";
	home.homeDirectory = "/home/kabir";
	
	programs = {
		bash = {
			enable = true;
  			initExtra = ''
				export PATH=$PATH:/usr/bin 
			  
        echo ॐ गं गणपतये नमः।

        source git-prompt.sh
        PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\n\[\e[2m\]╭─ \[\e[3m\]\[\e[0m\] \[\e[2;3m\]\u\[\e[23m\] ── \[\e[3m\]\[\e[0m\]  \[\e[2;3m\]\w\[\e[23m\] ── \[\e[3m\]$PS1_CMD1\[\e[23m\] ── \[\e[1m\]\n\[\e[0;2m\]│\n\[\e[0m\]\[\e[2m\]╰─(󰥳) \[\e[0m\]'
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
