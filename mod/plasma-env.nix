{ config, pkgs, lib, inputs, ... }:
let
  cfg = config.plasma-env;
in
{
  imports = [

  ];

  options = {
    plasma-env.enable = lib.mkEnableOption "Plasma 6 Environment";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;

    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    environment.systemPackages = with pkgs; [
      kdePackages.kate
    ];
  };
}