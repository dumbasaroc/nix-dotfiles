{inputs, lib, pkgs, config, home-manager, ...}:
{
  home-manager.users.roc = {
    programs.thunderbird = {
      enable = true;
    };
  };
}
