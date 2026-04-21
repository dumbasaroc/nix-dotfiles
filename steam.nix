# Steam

{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # steam
    # mesa
    steam-devices-udev-rules
  ];
}
