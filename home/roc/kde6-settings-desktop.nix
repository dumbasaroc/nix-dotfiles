{inputs, lib, pkgs, config, home-manager, ...}:
{
  home-manager.users.roc.programs.plasma = {
    
    enable = true;

    # Themeing, Cursors, Icons
    workspace = {

      # Look and Feel (Global Theme)
      lookAndFeel = "org.kde.breezetwilight.desktop";
      
      # Cursor
      cursor = {
        theme = "Bibata-Modern-Classic";
        size = 24;
      };

      # Icon Theme
      iconTheme = "Papirus";

      # Wallpaper
      wallpaper = ./bgimg/niri_bg.jpg;
      wallpaperFillMode = "stretch";
    };
    
    # Panel Configuration #
    panels = [
      
      # Bottom Panel with Systray and Icons
      {
        floating = false;
        height = 48;
        hiding = "normalpanel";
        lengthMode = "fill";
        location = "bottom";
        opacity = "translucent";
        screen = "all";
      }
    ];
  };
}
