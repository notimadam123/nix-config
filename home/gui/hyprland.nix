{ pkgs, config, inputs, ... }:


  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    settings = {
      "$mod" = "SUPER";

      monitor = [
        "DP-2,3440x1440@165,1920x147,1"
        "DP-3,1920x1080@144,840x0,1"
      ];

      env = [
        "QT_STYLE_OVERRIDE,kvantum"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "XDG_SESSION_TYPE,wayland"
      ];

      cursor = {
          default_monitor = "DP-2";
      };

      general = {
        col.active_border = "#eba0ac";
        col.inactive_border = "#bac2de";
        gaps_in = "3";
        gaps_out = "8";
        border_size = "3";
        layout = "dwindle";
      };

      decoration = {
        blur = {
          enabled = true;
          size = "6";
          passes = "3";
          new_optimizations = true;
          xray = false;
          ignore_opactiy = true;
        };
        rounding = "10";
        drop_shadow = false;
      };

      animations = {
        enabled = true;
        bezier = "md3_standard, 0.2, 0, 0, 1";
        bezier = "md3_decel, 0.05, 0.7, 0.1, 1";
        bezier = "md3_accel, 0.3, 0, 0.8, 0.15";
        bezier = "overshot, 0.05, 0.9, 0.1, 1.1";
        bezier = "crazyshot, 0.1, 1.5, 0.76, 0.92";
        bezier = "hyprnostretch, 0.05, 0.9, 0.1, 1.0";
        bezier = "fluent_decel, 0.1, 1, 0, 1";
        bezier = "easeInOutCird, 0.85, 0, 0.15, 1";
        bezier = "easeOutCirc, 0, 0.55, 0.45, 1";


        animation = "windows, 1, 3, overshot, popin 60%";
        animation = "border, 1, 10, default";
        animation = "fade, 1, 2, default";
        animation = "workspaces, 1, 4.5, md3_decel, slidefade 15%";
        animation = "specialWorkspace, 1, 3, md3_decel, slidevert";
      };

      misc = {
        vfr = true;
      };

      input = {
        kb_layout = keyboardLayout;
        repeat_delay = "300";
        repeat_rate = "50";
        special_fallthrough = true;
        follow_mouse = 1
        accel_profile = "flat";
        force_no_accel = true;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          clickfinger_behavior = true;
          scroll_factor = 0.5;
        };
      };
  }
