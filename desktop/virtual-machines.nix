{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    dnsmasq
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.roc.extraGroups = [ "libvirtd" ];
}
