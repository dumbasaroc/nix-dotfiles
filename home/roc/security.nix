
{inputs, lib, pkgs, config, home-manager, ...}:
{
  
  users.users.roc.extraGroups = [ "wireshark" ];

  home-manager.users.roc = {
    home.packages = with pkgs; [
      wireshark
    ];
  };
}
