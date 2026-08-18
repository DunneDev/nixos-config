{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./modules/niri.nix
  ];

  home = {
    stateVersion = "26.05";
    username = "seb";

    sessionPath = [
      "$.cargo/bin"
    ];

    packages = with pkgs; [
      neovim
      rustup
      kitty
      tree-sitter
      fzf
      ripgrep
      fd
      nixpkgs-fmt
      nautilus
      nodejs
      unzip
      gcc
      pkg-config
      statix
      openssl
      openssl.dev
    ];
  };
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
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/seb/nixos-dotfiles/config/nvim";
    recursive = true;
  };

}
