
{ config, lib, pkgs, inputs, ... }:
{
  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
    usbmon.enable = true;
  };
}
