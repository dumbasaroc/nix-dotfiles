# Standard Packages - System

{ config, lib, pkgs, ... }:
{
  services.flatpak.enable = true;
  xdg.portal = {
    wlr.enable = true;
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    firefox
    librewolf

    direnv
    killall

    # Control packages
    brightnessctl
    pavucontrol
  ];
}
