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
    ./roc/nixvim.nix
    ./roc/kde6-settings-desktop.nix
  ];

  home-manager.users.roc = {
    home.packages = with pkgs; [
      kitty
      tree
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      papirus-icon-theme
      bibata-cursors

      gh
    ];

    # === FILES == #

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
        '';
      };
    };

    # == ENDFILES == #

    programs.zsh = {
      enable = true;
      initContent = ''
        PATH="''$PATH:''$HOME/.nixos/bin"
        eval "''$(starship init zsh)"
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
