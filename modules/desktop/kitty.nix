{ config, pkgs, ... }: {
  home-manager.users.vlad = { pkgs, ... }: {
    programs.kitty = {
      enable = true;
      extraConfig = ''
        font_family JetBrains Mono Nerd Font 
        font_size 14.0

        shell ${pkgs.fish}/bin/fish

        env TERM=xterm-256color

        background_opacity 1

        window_margin_width 10
        window_margin_height 10

        foreground              #cdd6f4
        background              #1e1e2e
        selection_foreground    #1e1e2e
        selection_background    #f5e0dc

        # Cursor colors
        cursor                  #f5e0dc
        cursor_text_color       #1e1e2e

        # URL underline color when hovering with mouse
        url_color               #f5e0dc

        # Kitty window border colors
        active_border_color     #b4befe
        inactive_border_color   #6c7086
        bell_border_color       #f9e2af

        # OS Window titlebar colors
        wayland_titlebar_color system
        macos_titlebar_color system

        # Tab bar colors
        active_tab_foreground   #11111b
        active_tab_background   #cba6f7
        inactive_tab_foreground #cdd6f4
        inactive_tab_background #1e1e2e
        tab_bar_background      #11111b

        # Colors for marks (marked text in the terminal)
        mark1_foreground #1e1e2e
        mark1_background #b4befe
        mark2_foreground #1e1e2e
        mark2_background #cba6f7
        mark3_foreground #1e1e2e
        mark3_background #74c7ec

        # The 16 terminal colors

        # black
        color0 #45475a
        color8 #585b70

        # red
        color1 #f38ba8
        color9 #f38ba8

        # green
        color2  #a6e3a1
        color10 #a6e3a1

        # yellow
        color3  #f9e2af
        color11 #f9e2af

        # blue
        color4  #89b4fa
        color12 #89b4fa

        # magenta
        color5  #f5c2e7
        color13 #f5c2e7

        # cyan
        color6  #94e2d5
        color14 #94e2d5

        # white
        color7  #bac2de
        color15 #a6adc8
      '';
    };
  };
}