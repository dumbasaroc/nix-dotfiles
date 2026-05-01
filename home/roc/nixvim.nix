{inputs, lib, pkgs, config, ...}: {
  # imports = [
  #   nixvim.homeModules.nixvim
  # ];

  programs.nixvim = {
    enable = true;

    plugins = {
      
      # Lazy.VIM
      lazy = {
        enable = true;
      };
    };
  };
}
