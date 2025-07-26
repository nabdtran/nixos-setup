{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    kitty
    git
    htop
    firefox
    fio
    font-awesome
    noto-fonts
    waybar
    wofi
    vscode
    nwg-displays

    rofi
    hyprpaper
    
    # System Tools
    polkit_gnome
  ];

  programs.thunar.enable = true;
  
  programs.nano = {
    enable = true;
    nanorc = ''
      set autoindent
    '';
  };
}