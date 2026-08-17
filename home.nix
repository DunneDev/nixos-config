{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.username = "seb";

  programs = {
    git = {
      enable = true;
      userName = "Sebastien Dunne";
      userEmail = "sebastien.dunne@protonmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        core.editor = "nvim";
      };
    };

    fish.enable = true;
    gh.enable = true;

    noctalia = {
      enable = true;
    };

    niri = {
      settings = {
        spawn-at-startup = [
          { command = [ "noctalia" ]; }
        ];

        binds = {
          "Mod+Return".action.spawn = [ "kitty" ]; 
        };
      };
    };
  };

  home.packages = with pkgs; [
    kitty
  ];

  home.stateVersion = "26.05";
}
