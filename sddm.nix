
{ config, lib, pkgs, inputs, ... }: let
  sddm-astronaut = (pkgs.sddm-astronaut.override {
    embeddedTheme = "astronaut";
  });
in {
  environment.systemPackages = [ sddm-astronaut ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    extraPackages = with pkgs; [
      kdePackages.qtmultimedia # Apparently required for video/audio backgrounds
    ];
    theme = "sddm-astronaut-theme";
  };
}
