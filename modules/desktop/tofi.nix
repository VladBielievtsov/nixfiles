{ config, pkgs, ... }: {
  home-manager.users.vlad = { pkgs, ... }: {
    programs.tofi = {
      enable = true;
      settings = {
        text-color = "#cdd6f4";
        prompt-color = "#f38ba8";
        selection-color = "#f9e2af";
        background-color = "#1e1e2e";
        width = "100%";
        height = "100%";
        border-width = 0;
        outline-width = 0;
        padding-top = "30%";
        padding-bottom = "30%";
        padding-left = "8%";
        padding-right = "8%";
        result-spacing = 25;
        num-results = 5;
        font = "MapleMono";
        clip-to-padding = true;
        hide-cursor = true;
      };
    };
  };
}