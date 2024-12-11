{ config, pkgs, ... }: {
  home-manager.users.vlad = { pkgs, ... }: {
    programs.waybar = {
      enable = true;
      systemd = {
        enable = true;
	      target = "hyprland-session.target";
      };
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 40;
          spacing = 20;
          margin = "0px";
          output = [ "DP-1" ];

          modules-left = [ "custom/logo" "hyprland/workspaces" ];
          # modules-center = [ "custom/spotify" ];
          modules-right = [ "pulseaudio" "network" "tray" "clock" ];

          "custom/logo" = {
            format = "";
            "tooltip" = true;
            "tooltip-format" = "Hello 👋";
          };

          clock = {
            format = "󰸗 {:%a %b %d  %H:%M}";
            "tooltip" = false;
          };

          tray = {
            icon-size = 19;
            spacing = 10;
          };

          pulseaudio = {
            format = "󰕾 {volume}%";
            "format-muted" = "MUTE";
            "on-click" = "pavucontrol";
          };

          network = {
            format = "󰣺 Wired";
            "format-disconnected" = "󰣼 OFFLINE";
            interval = 2;
          };

          "hyprland/workspaces" = {
            format = "{icon}";
            "on-click" = "activate";
            "format-icons" = {
              active = "";
              default = "";
            };
            "persistent-workspaces" = {
              "1" = [];
              "2" = [];
              "3" = [];
              "4" = [];
              "5" = [];
            };
          };
        };
      };
      style = ''
        @define-color rosewater #f5e0dc;
        @define-color flamingo #f2cdcd;
        @define-color pink #f5c2e7;
        @define-color mauve #cba6f7;
        @define-color red #f38ba8;
        @define-color maroon #eba0ac;
        @define-color peach #fab387;
        @define-color yellow #f9e2af;
        @define-color green #a6e3a1;
        @define-color teal #94e2d5;
        @define-color sky #89dceb;
        @define-color sapphire #74c7ec;
        @define-color blue #89b4fa;
        @define-color lavender #b4befe;
        @define-color text #cdd6f4;
        @define-color subtext1 #bac2de;
        @define-color subtext0 #a6adc8;
        @define-color overlay2 #9399b2;
        @define-color overlay1 #7f849c;
        @define-color overlay0 #6c7086;
        @define-color surface2 #585b70;
        @define-color surface1 #45475a;
        @define-color surface0 #313244;
        @define-color base #1e1e2e;
        @define-color mantle #181825;
        @define-color crust #11111b;

        * {
          font-family: "MapleMono";
          border: none;
          border-radius: 0;
          min-height: 0;
          margin: 0;
          padding: 0;
        }

        window#waybar {
          background: @mantle;
          color: @mauve;
          border-bottom: 2px solid @mauve;
        }

        #custom-logo {
          color: @sky;
          padding: 0px 0px 0px 10px;
          font-size: 20px;
        }

        #workspaces {
          padding: 10px 0px;
        }

        #workspaces button {
          font-size: 0px;
          background-color: @teal;
          margin: 2px 8px;
          border-radius: 20px;
          border: none;
          min-width: 16px;
          min-height: 12px;
        }

        #workspaces button.active,
        #workspaces button.empty.active {
          background-color: @maroon;
          min-width: 40px;
        }

        #workspaces button:hover {
          border: none;
          box-shadow: none;
        }

        #workspaces button.empty {
          background-color: @flamingo;
        }

        #clock {
          padding: 0px 15px 0px 0px;
          font-size: 17px;
          font-weight: 800;
          color: @pink;
        }

        #network {
          font-size: 17px;
          font-weight: 800;
          color: @mauve;
        }

        #pulseaudio {
          font-size: 17px;
          font-weight: 800;
          color: @red;
        }

        #network.disconnected {
          color: @red;
        }
      '';
    };
  };
}
