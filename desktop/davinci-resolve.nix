{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    davinci-resolve
    ffmpeg-full
  ];
}
