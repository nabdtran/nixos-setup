{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kitty
    git
    htop
    firefox
    fio
    vim
    font-awesome
    noto-fonts
    waybar
    wofi
    vscode
    nwg-displays
    hyprpaper
    
    # System Tools
    tlp
    networkmanagerapplet
    lxqt.lxqt-policykit
    cpupower-gui
    
    # Diagnostic Tools
    pavucontrol         # Graphical audio mixer
    cpufrequtils        # For cpufreq-info
    wl-clipboard        # Clipboard tool for Wayland
    udisks              # For USB auto-mounting

    # Volumes
    ntfs3g
    exfatprogs

    catppuccin-sddm
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.thunar.enable = true;

  programs.nano = {
    enable = true;
    nanorc = ''
      set autoindent
    '';
  };

  # Thunar
  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  services.udisks2.enable = true;

  # --- POLKIT (Permissions & Password Prompts) ---
  security.polkit.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    settings = {
      General = {
        background = "/usr/local/share/wallpapers/dandadan.jpg";
      };
    };
  };

  services.displayManager.sessionPackages = [
    pkgs.hyprland
  ];
}
