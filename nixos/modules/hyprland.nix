{ config, pkgs, ... }:

{
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
