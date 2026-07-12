{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    dnsmasq
    spice-gtk
    OVMF
  ];

  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;

  users.users.roc.extraGroups = [ "libvirtd" "qemu" "kvm" ];
}
