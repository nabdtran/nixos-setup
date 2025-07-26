# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/users.nix
      ./modules/system.nix
      ./modules/programs.nix
      ./modules/hyprland.nix
      ./modules/hardware.nix
    ];

  system.stateVersion = "25.05";
}
