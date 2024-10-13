{ pkgs, config, inputs, ... }:


  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    settings = {
      "$mod" = "SUPER";

      exec-once = [
        "swww-daemon &"
        "ags &"
        "udiskie"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "gnome-keyring-daemon --start --components=secrets"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "hypridle"
        "dbus-update-activation-environment --all"
        
        "[workspace 1 silent] firefox"
        "[workspace 4 silent] spotify"
        "[workspace 5 silent] steam"
        "[workspace 9 silent] easyeffects"
      ]
    

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
        accel_profile = "flat";
        force_no_accel = true;
        follow_mouse = 1

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          clickfinger_behavior = true;
          scroll_factor = 0.5;
        };

      bind = [
          "bind = $mainMod, Q, killactive"
          "bind = $mainMod, F, fullscreen"
          "bind = $mainMod shift, Space, togglefloating"
          "bind = $mainMod, J, movefocus, l"
          "bind = $mainMod, K, movefocus, r"
          "bind = $mainMod shift, h, movewindow, l"
          "bind = $mainMod shift, j, movewindow, d"
          "bind = $mainMod shift, k, movewindow, u"
          "bind = $mainMod shift, l, movewindow, r"
          "bind = $mainMod, h, resizeactive, -100 0"
          "bind = $mainMod, l, resizeactive, 100 0"
          "bind = $mainMod, Space, swapsplit"
          "bind = $mainMod, s, pin"             
          "bindm = $mainMod, mouse:272, movewindow"
          "bindm = $mainMod, mouse:273, resizewindow"
          "bind = $mainMod, W, exec, firefox"
          "bind = $mainMod, E, exec, bemoji -t"
          "bind = $mainMod, R, exec, nautilus"
          "bind = $mainMod, Y, exec, flatpak run dev.vencord.Vesktop"
          "bind = $mainMod, U, exec, flatpak run com.obsproject.Studio"
          "bind = $mainMod, I, exec, flatpak run com.lunarclient.LunarClient"
          "bind = $mainMod, O, exec, prismlauncher"
          "bind = $mainMod, D, exec, fuzzel"
          "bind = $mainMod, backspace, exec, hyprlock"
          "bind = $mainMod shift, C, exec, hyprpicker -a"
          "bind = $mainMod, V, exec, cliphist list | fuzzel --dmenu | cliphost decode | wl-copy"
          "bind = $mainMod shift, V, exec, foot -e cava"
          "bind = $mainMod, N, exec, flatpak run com.valvesoftware.Steam"
          "bind = $mainMod, M, exec, flatpak run com.spotify.Spotify"
          "bind = $mainMod, Return, exec, foot"
          "bind = , Print, exec, grimblast --freeze copysave area $shot"
          "bind = Ctrl, Print, exec, grimblast --freeze save area - | swappy -f -"
          "bind = SHIFT, Print, exec, grimblast copysave output $shots"
          "bind = Ctrl SHIFT, Print, exec, grimblast --freeze save output - | swappy -f -"
          "bind = $mainMod, Print, exec, grimblast --freeze copysave active $shot"
          "bind = $mainMod Ctrl, Print, exec, grimblast --freeze save active - | swappy -f -"
          
          "bindl  = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle # Mute sound"
          "bindle = , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          "bindle = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          "bindl  = , XF86AudioNext, exec, playerctl next"
          "bindl  = , XF86AudioPrev, exec, playerctl previous"
          "bindl  = , XF86AudioPlay, exec, playerctl play-pause"
          "bindle = , XF86MonBrightnessUp, exec, brightnessctl set '12.75+'"
          "bindle = , XF86MonBrightnessDown, exec, brightnessctl set '12.75-'"
          "bind = $mainMod, 1, split-workspace, 1"
          "bind = $mainMod, 2, split-workspace, 2"
          "bind = $mainMod, 3, split-workspace, 3"
          "bind = $mainMod, 4, split-workspace, 4"
          "bind = $mainMod, 5, split-workspace, 5"
          "bind = $mainMod, 6, split-workspace, 6"
          "bind = $mainMod, 7, split-workspace, 7"
          "bind = $mainMod, 8, split-workspace, 8"
          "bind = $mainMod, 9, split-workspace, 9"
          "bind = $mainMod, 0, split-workspace, 10"
          "bind = $mainMod SHIFT, 1, split-movetoworkspace, 1"
          "bind = $mainMod SHIFT, 2, split-movetoworkspace, 2"
          "bind = $mainMod SHIFT, 3, split-movetoworkspace, 3"
          "bind = $mainMod SHIFT, 4, split-movetoworkspace, 4"
          "bind = $mainMod SHIFT, 5, split-movetoworkspace, 5"
          "bind = $mainMod SHIFT, 6, split-movetoworkspace, 6"
          "bind = $mainMod SHIFT, 7, split-movetoworkspace, 7"
          "bind = $mainMod SHIFT, 8, split-movetoworkspace, 8"
          "bind = $mainMod SHIFT, 9, split-movetoworkspace, 9"
          "bind = $mainMod SHIFT, 0, split-movetoworkspace, 10"
      ]
    };
  }
