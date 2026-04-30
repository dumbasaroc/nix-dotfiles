{inputs, lib, pkgs, config, home-manager, ...}:
{
  home-manager.users.roc = {
    home.packages = with pkgs; [
      penpot-desktop
      inkscape
      gimp
    ];

  };
}
