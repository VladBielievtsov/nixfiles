{ config, lib, pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  imports = [
    ./hardware-configuration.nix
    ./modules/desktop
  ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = ["nodev"];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos";

  time.timeZone = "Europe/Kyiv";

  home-manager.users.vlad = { pkgs, ... }: {
    home.pointerCursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Catppuccin-Mocha-Dark-Cursors";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
  };
  
  users.users.vlad = {
    isNormalUser = true;
    home = "/home/vlad";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      firefox
      fastfetch
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    neovim
    ripgrep
    fd
    fzf
    gnumake
    gcc
    wget
    git
    go
    python3
  ];

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = [ "Liberation Serif" "Noto Serif" "Noto Color Emoji" ];
        sansSerif = [ "Inter" "Liberation Sans" "Noto Sans"  "Noto Color Emoji" ];
        monospace = [ "Cozette" "JetBrains Mono" "Liberation Mono" "Noto Sans Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
      antialias = true;
      hinting.enable = true;
      hinting.style = "slight";
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
    };
    packages = with pkgs; [
      liberation_ttf noto-fonts noto-fonts-cjk-sans noto-fonts-emoji noto-fonts-extra
      cozette jetbrains-mono fira-code fira-code-symbols hack-font victor-mono
      inter roboto roboto-mono ubuntu_font_family font-awesome
      material-design-icons material-icons noto-fonts-lgc-plus dejavu_fonts
      freefont_ttf gyre-fonts maple-mono
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.hack
      nerd-fonts.space-mono
      nerd-fonts.droid-sans-mono
      nerd-fonts.victor-mono
    ];
  };
  
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
