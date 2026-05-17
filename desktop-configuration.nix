{ config, lib, pkgs, inputs, ... }:

{
  hardware.opengl.extraPackages = with pkgs; [
    mesa.opencl
  ];
}
