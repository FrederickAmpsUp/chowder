{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "chowder";

  time.timeZone = "UTC"; # TODO: parameterize this
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = false;

  services.openssh.enable = true;

  system.stateVersion = "24.05";
}
