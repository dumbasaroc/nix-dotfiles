{ config, lib, pkgs, inputs, ... }:

{
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.graphics.extraPackages = with pkgs; [
    mesa.opencl
  ];
}
