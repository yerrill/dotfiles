{ config, pkgs, inputs, ... }:
{
  users.users.zach = {
    description = "Zach";
    isNormalUser = true;
    initialPassword = "123123";
    extraGroups = [ "wheel" "sudo" "networkmanager" ];
    packages = with pkgs; [

    ];
  };

  nixpkgs.config.allowUnfree = true;
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    curl
    wget
    tree
    alacritty
    vlc
    lazygit
  ];

  environment.sessionVariables = {
    SUDO_EDITOR = "nvim";
  };

  programs.git.enable = true;

  programs.firefox.enable = true;

  programs.neovim.enable = true;
}
