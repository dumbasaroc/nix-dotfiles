
{inputs, lib, pkgs, config, home-manager, ...}:
{
  
  users.users.roc.extraGroups = [ "wireshark" ];

  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
    usbmon.enable = true;
  };
}
