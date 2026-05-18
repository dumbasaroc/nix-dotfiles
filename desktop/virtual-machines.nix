{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    dnsmasq
    spice-gtk
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.roc.extraGroups = [ "libvirtd" ];
}
