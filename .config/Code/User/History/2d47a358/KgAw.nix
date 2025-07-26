{ config, pkgs, ... }:

{
  # Add this block to automatically start the Polkit agent for your user
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # --- ESSENTIAL BACKGROUND SERVICES ---
  security.rtkit.enable = true;
  services.dbus.enable = true;

  # --- POLKIT (Permissions & Password Prompts) ---
  security.polkit.enable = true;
}