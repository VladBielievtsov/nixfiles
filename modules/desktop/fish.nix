{ config, pkgs, ... }: {
  programs.fish.enable = true;

  home-manager.users.vlad = { pkgs, ... }: {
    programs.fish = {
      enable = true;

      interactiveShellInit = ''
        if type -q thefuck
          thefuck --alias | source
        end
      '';

      shellAliases = {
        ls = "exa --icons --group-directories-first";
        ll = "exa -l --icons --group-directories-first";
        la = "exa -la --icons --group-directories-first";
        tree = "exa --tree --icons";
        cat = "bat";
        g = "git";
        gc = "git commit -m";
      };
    };
    home.packages = with pkgs; [
      bat eza yazi btop thefuck
    ];
  };

}