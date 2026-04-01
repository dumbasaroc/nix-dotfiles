{inputs, lib, pkgs, config, ...}: let
  home-manager = inputs.home-manager;
in {
  users.users.roc = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  home-manager.users.roc = {
    home.packages = with pkgs; [
      kitty
      tree
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    programs.zsh = {
      initContent = ''eval "''$(starship init zsh)"'';
    };

    programs = {
      starship = {
        enable = true;
        presets = [ "jetpack" ];
      };
    };

    home.stateVersion = "25.11";
  };

}