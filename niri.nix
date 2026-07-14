# Niri Configuration

{ config, lib, pkgs, inputs, ... }:
{
  programs.niri = {
    enable = true;
    useNautilus = true;
  };

  services.iio-niri.enable = true;

  # Thunar File Browser Thumbnailer
  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    fuzzel

    # Cursor Theme
    rose-pine-cursor

    # # Bar
    # inputs.roc-ags-shell.packages."x86_64-linux".default
    # swaynotificationcenter

    # # Wallpaper
    # swaybg

    # XWayland
    xwayland-satellite
  ];
}

