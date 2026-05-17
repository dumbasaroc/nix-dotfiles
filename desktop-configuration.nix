{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./desktop/davinci-resolve.nix
  ];

  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
  };
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.graphics.extraPackages = with pkgs; [
    mesa.opencl
  ];

  nixpkgs.config.rocmSupport = true;

  environment.systemPackages = with pkgs; [
    clinfo
    fastfetch
    blender
  ];
}
