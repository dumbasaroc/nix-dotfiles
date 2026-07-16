{inputs, lib, pkgs, config, ...}: let
  home-manager = inputs.home-manager;
  nixvim = inputs.nixvim;
in {
  users.users.roc = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  imports = [
    ./roc/cli.nix
    ./roc/design.nix
    # ./roc/kde6-settings-desktop.nix
    ./roc/nixvim.nix
    ./roc/noctalia.nix
    ./roc/security.nix
    ./roc/thunderbird.nix
  ];

  home-manager.users.roc = {
    home.packages = with pkgs; [
      kitty
      tree
      bazaar
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      kdePackages.kdenlive
      papirus-icon-theme
      bibata-cursors

      gh
      nix-search-tv
      fzf
      nwg-icon-picker

      apotris
      trilium-next-desktop
    ];

    # === FILES == #

    ## ==== SCRIPTS ==== ##

    home.file.".scripts" = {
      enable = true;
      recursive = true;
      source = ./roc/.scripts;
    };

    ## ==== BACKGROUND IMAGES ==== ##

    home.file.".bgimg" = {
      enable = true;
      recursive = true;
      source = ./roc/.bgimg;
    };

    xdg.configFile = {
      "kitty/kitty.conf" = {
        enable = true;
        text = ''
          font_family           FiraCode Nerd Font
          font_size             12.0

          shell_integration     enabled

          hide_window_decorations      yes

          background_opacity           0.7
          background_blur              32
        '';
      };
    };

    # == ENDFILES == #

    programs.zsh = {
      enable = true;
      initContent = ''
        PATH="''$PATH:''$HOME/.nixos/bin"
        eval "''$(starship init zsh)"

        PATH="''$PATH:''$HOME/.scripts"
        alias mkenter="source mkenter"
      '';
    };

    programs = {
      starship = {
        enable = true;
        settings = {
          cmd_duration = {
            disabled = true;
          };
        };
        presets = [ "catppuccin-powerline" ];
      };
    };

    home.stateVersion = "25.11";
  };

}
