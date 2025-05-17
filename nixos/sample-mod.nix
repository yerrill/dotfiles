{ config, pkgs, lib, inputs, ... }:
let
  cfg = config.sample-mod;
in
{
  imports = [

  ];

  options = {
    test.enable = lib.mkEnableOption "Sample Module";
  };

  config = lib.mkIf cfg.enable {
    
  };
}