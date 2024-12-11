{ config, pkgs, ... }: {

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.vlad = { pkgs, ... }: {
      home.stateVersion = "24.05";

      xdg.configFile."hypr/hyprpaper.conf".text = ''
        preload = ${config.users.users.vlad.home}/.config/hypr/wallpapers/001.png
        wallpaper = DP-1,${config.users.users.vlad.home}/.config/hypr/wallpapers/001.png
        ipc = off
        splash = false
      '';

      home.file.".config/hypr/wallpapers/001.png".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/VladBielievtsov/dotfiles/main/wallpapers/001.png";
        sha256 = "9c4fb11818afa1c68fecfbffe65d353031ce0729740ae5517180b2458dd59cb1";
      };

      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        systemd.variables = ["--all"];
        xwayland.enable = true;

        settings = {
          "$mainMod" = "SUPER";
          "$terminal" = "kitty";
          "$menu" = "wofi --show drun";

          monitor = ["DP-1, preferred, auto, 1"];

          workspace = [
            "1,monitor:DP-1,default:true,on-created-empty:$terminal"
            "2,monitor:DP-1"
            "3,monitor:DP-1"
            "4,monitor:DP-1"
            "5,monitor:DP-1"
          ];

          exec-once = [
            "wl-clipboard-history -t"
            "hyprpaper"
          ];

          env = [
            "XCURSOR_SIZE,24"
            "HYPRCURSOR_SIZE,24"
            "XDG_CURRENT_DESKTOP,Hyprland"
            "XDG_SESSION_TYPE,wayland"
            "XDG_SESSION_DESKTOP,Hyprland"
          ];

          general = {
            gaps_in = 5;
            gaps_out = 10;
            border_size = 2;
            "col.active_border" = "rgba(cba6f7ff)";
            "col.inactive_border" = "rgba(45475aff)";
            layout = "dwindle";
            resize_on_border = true;
            extend_border_grab_area = 15;
            hover_icon_on_border = true;
            no_focus_fallback = false;
          };

          decoration = {
            rounding = 6;
          };

          animations = {
            enabled = true;
            bezier = [
              "myBezier, 0.05, 0.9, 0.1, 1.05"
              "linear, 0.0, 0.0, 1.0, 1.0"
            ];
            animation = [
              "windows, 1, 4, myBezier"
              "windowsOut, 1, 4, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 8, linear, loop"
              "fade, 1, 5, default"
              "workspaces, 1, 3, default, slide"
            ];
          };

          input = {
            kb_layout = "us";
            follow_mouse = 1;
            sensitivity = 0;
          };
          
          misc = {
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
            force_default_wallpaper = 0;
            vfr = true;
            vrr = 0;
            mouse_move_enables_dpms = true;
            key_press_enables_dpms = true;
          };

          bind = [
            "$mainMod, RETURN, exec, $terminal"
            # "$mainMod, tab, exec, $menu"
            "$mainMod, tab, exec, tofi-drun --drun-launch=true --fuzzy-match=true"
            "$mainMod, W, killactive"
            "$mainMod, V, togglefloating"
            "CTRL SHIFT, S, exec, grimblast --notify copysave area ~/pictures/screenshots/area_$(date +%Y-%m-%d_%H-%M-%S).png"
            "CTRL ALT, S, exec, grimblast --notify copysave screen ~/pictures/screenshots/screen_$(date +%Y-%m-%d_%H-%M-%S).png"
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"
            "$mainMod, 1, workspace, 1" 
            "$mainMod, 2, workspace, 2" 
            "$mainMod, 3, workspace, 3" 
            "$mainMod, 4, workspace, 4" 
            "$mainMod, 5, workspace, 5"
            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
          ];

          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];

          windowrule = [
            "float, class:^(pavucontrol)$"
          ];
        };
      };
      home.packages = with pkgs; [
        hyprpaper xsettingsd wofi wl-clipboard grim slurp grimblast
      ];
    };
  };

}
