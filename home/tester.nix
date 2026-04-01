{inputs, lib, pkgs, config, ...}: let
  home-manager = inputs.home-manager;
in {
  users.users.tester.isNormalUser = true;
  home-manager.users.tester = {
    home.packages = with pkgs; [
      emacs
    ];

    home.stateVersion = "25.11";
  };
}