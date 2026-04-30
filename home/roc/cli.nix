{inputs, lib, pkgs, config, home-manager, ...}:
{
  home-manager.users.roc = {
    home.packages = with pkgs; [
      mc
      lf
    ];

    programs.btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
      };
    };

  };
}
