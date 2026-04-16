{ config, pkgs, ... }:

{
  users.users.chowder-user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "chowder";
  };
}
