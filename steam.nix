# Steam

{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # steam
    mesa
    steam-devices-udev-rules
  ];

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers

    gamescopeSession = {
      enable = true;
    };
  };

  programs.opengamepadui = {
    enable = true;
    inputplumber.enable = true;
    powerstation.enable = true;
    gamescopeSession = {
      enable = true;
    };
  };
}
