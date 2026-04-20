# Niri Configuration

{ config, lib, pkgs, inputs, ... }:
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
    inputs.quickshell.packages."x86_64-linux".default
    kdePackages.qtlocation

    # Wallpaper
    swaybg

    # XWayland
    xwayland-satellite
  ];
}

