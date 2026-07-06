
{inputs, lib, pkgs, config, home-manager, ...}:
{
  
  users.users.roc.extraGroups = [ "wireshark" ];

}
