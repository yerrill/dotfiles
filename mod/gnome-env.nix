{ config, pkgs, lib, inputs, ... }:
let
  cfg = config.gnome-env;
in
{
  imports = [

  ];

  options = {
    gnome-env.enable = lib.mkEnableOption "Gnome Environment";
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}