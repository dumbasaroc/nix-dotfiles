
{ config, lib, pkgs, inputs, ... }:
{
  virtualisation.waydroid = {
    enable = true;
  };

  environment.systemPackages = [
    pkgs.wl-clipboard
  ];
}
