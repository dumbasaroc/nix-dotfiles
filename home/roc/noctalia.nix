
{inputs, lib, pkgs, config, ...}: let
in {
  
  home-manager.users.roc = {
    
    # Import Noctalia Shell Home Module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
    };
  };

}
