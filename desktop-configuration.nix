{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./desktop/davinci-resolve.nix
    ./desktop/virtual-machines.nix
    # ./desktop/waydroid.nix
  ];

  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
    EDITOR = "nvim";
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = 32;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa.opencl
    ];
  };

  nixpkgs.config.rocmSupport = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };


  environment.systemPackages = with pkgs; [
    clinfo
    fastfetch
    android-tools
    distrobox
  ];

  users.users.roc.extraGroups = [ "adbusers" ];
}
