# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  # Boot Config
  boot = {
    loader = { 
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    
    consoleLogLevel = 3; # Silence first boot output

    initrd = {
      verbose = false;
      systemd.enable = true;
    };
    
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
    
    # Use latest kernel and add modules.
    kernelPackages = pkgs.linuxPackages_latest;
    
    # kernelModules = [ "kvm-intel" ]; # for virtualisation

    plymouth = {
      enable = true;
      theme = "bgrt";
      /*
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "splash" ];
        })
      ];
      */
    };
  };

  # virtualisation.libvirtd.enable = true;

  # Enable backlight support
  hardware.i2c.enable = true;
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Crucial for 32-bit games like GTA IV/NextGen
  };

  # Define your hostname.
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;
  
  networking.nftables.enable = true;

  services.avahi.enable = false;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # i18n.defaultLocale = "en_IN.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ALL = "en_US.UTF-8"; # This overrides all other LC_* settings.
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  services.gnome.core-apps.enable = false;
  
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
    ];
    
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  #  Stylix config
  stylix = {
    enable = true;
    polarity = "dark";
    image = ./Media/Wallpapers/Lotus_rose-pine.png;
    # cursor = {
      # package = pkgs.bibata-cursors;
      # name = "Bibata-Modern-Amber";
    # };
    targets.plymouth.enable = false;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml"; # or chalk, da-one-ocean
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    # variant = "";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    kabir = {
      isNormalUser = true;
      description = "Kabir Bakshi";
      extraGroups = [ "networkmanager" "wheel" ]; # i2c for baclight control
      packages = with pkgs; [
        # thunderbird 
      ];
    };
  };

  security.sudo.extraRules = [
    { 
      users = [ "kabir" ];
      commands = [ 
        {
          command = "/run/current-system/sw/bin/ddcutil";
          options = [ "NOPASSWD" ];
        }
      ]; 
    }
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    brave                           # Browser
    rclone                          # Backup
    anydesk                         # Remote desktop
    ddcutil                         # Backlight control
    localsend                       # File share
    easyeffects                     # Equaliser and other
    qbittorrent                     # Download manager
    git                             # Version control
    gparted                         # Editing disk partitions
    efibootmgr                      # Editing nvram
    unzip                           # Z-Archives
    btop                            # Task manager
    javaPackages.compiler.openjdk21 # Java
    neovim                          # Code Editor
    netbird                         # IP tunneling

    # GNOME
      nautilus
      refine
      eog
      gnome-terminal

    # KDE
      kdePackages.okular

    # Extensions
      gnomeExtensions.dash-to-dock
      gnomeExtensions.paperwm
      # gnomeExtensions.hide-top-bar # paperwm has it as a shortcut
      gnomeExtensions.appindicator

    # GAMES & WINDOWS
      heroic
      wineWow64Packages.staging # wine-staging (version with experimental features)
      winetricks # winetricks (all versions)
      wineWow64Packages.waylandFull # native wayland support (unstable)
      # parsec-bin

    # Cosmetic
      bibata-cursors
      persepolis
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    nerd-fonts.intone-mono
  ];
  
  services.netbird.enable = true; # Latest version can be obtained using manual installation method given in docs. but it needs you to run "sudo netbird service run" manually or you can set this command itself to run on boot.

  # Enable Flatpak
  services.flatpak.enable = true;

  services.flatpak.packages = [
    "org.telegram.desktop"

    { # elyprismlauncher
      flatpakref = "https://elyprismlauncher.github.io/flatpak/elyprismlauncher.flatpakref";
      sha256="b7c919c031d048cc01e2378909aa030e4737417008c5ab0ea29cab098b50b477";
    }

  ];
  
  virtualisation.waydroid.enable = true;
  
  # Permanently enable EXPERIMENTAL support for flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
} 
