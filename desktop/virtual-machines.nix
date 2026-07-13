{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    dnsmasq
    spice-gtk
    OVMF
  ];

  # Add QEMU firmware files to Virt-Manager
  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];

  virtualisation.libvirtd = {
    enable = true;
    qemu.package = pkgs.qemu;
  };
  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;

  users.users.roc.extraGroups = [ "libvirtd" "qemu" "kvm" ];
}
