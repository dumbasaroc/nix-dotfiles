# Niri Configuration

{ config, lib, pkgs, ... }:
{
  programs.niri = {
    enable = true;
    # useNautilus = true;
  };

  services.iio-niri.enable = true;

  environment.systemPackages = with pkgs; [
    thunar
    fuzzel

    # Bar
    waybar
  ];
}

