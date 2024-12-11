{ config, pkgs, ... }: {
  
  imports = [
    ./hyprland.nix
    ./kitty.nix
    ./fish.nix
    ./tofi.nix
    ./waybar.nix
  ];

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "nvidia" ];
  };

  hardware = {
    nvidia = {
      open = false;
      modesetting.enable = true;
      prime = {
        sync.enable = false;
      };
    };
  };

  security.rtkit.enable = true;
  services.seatd.enable = true;
  services.dbus.enable = true;  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      telegram-desktop discord dunst spotify kitty tmux micro wl-clipboard xdg-utils grim slurp vscode pavucontrol
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
