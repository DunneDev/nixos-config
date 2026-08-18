{
  pkgs,
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics.enable = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Canada/Eastern";

  i18n.defaultLocale = "en_CA.UTF-8";

  services = {
    displayManager.ly.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  users.users.seb = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "networkmanager"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  programs = {
    firefox.enable = true;
    fish.enable = true;
    niri.enable = true;
  };

  programs.noctalia = {
    enable = true;

    recommendedServices.enable = true;
    systemd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  hardware.bluetooth.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";
}
