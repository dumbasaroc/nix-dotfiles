# Fonts List

{ config, lib, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    # Nerd Fonts
    nerd-fonts.fira-code
    nerd-fonts.ubuntu
    nerd-fonts.monoid
    nerd-fonts.noto

    # Standard Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  environment.systemPackages = with pkgs; [
    fontconfig
  ];
}
