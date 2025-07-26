{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dandatran = {
    isNormalUser = true;
    description = "Danny Tran";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
