{ config, pkgs, lib, inputs, ... }:
let
  cfg = config.hyprland-env;
in
{
  imports = [

  ];

  options = {
    hyprland-env.enable = lib.mkEnableOption "Hyprland Environment";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      withUWSM = true;
      xwayland.enable = true;
    };

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    xdg.portal.enable = true;

    environment.systemPackages = with pkgs; [
      kitty
      kdePackages.dolphin
      rofi-wayland
      waybar
      dunst
    ];
  };
}
