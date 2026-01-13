{ pkgs, ... }:
{
  home-manager.users.yawd = {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 10;

          modules-left = [
            "custom/lambda"
            "sway/workspaces"
            "sway/mode"
          ];
          modules-center = [ "sway/window" ];
          modules-right = [
            "tray"
            "custom/arrow1"
            "pulseaudio"
            "custom/arrow2"
            "cpu"
            "custom/arrow3"
            "memory"
            "custom/arrow4"
            "network"
            "custom/arrow5"
            "battery"
            "custom/arrow6"
            "clock"
          ];

          # Module Specific Configurations
          "sway/workspaces" = {
            format = "{name}";
          };

          "sway/mode" = {
            format = "  {}";
          };

          "custom/lambda" = {
            format = "  λ";
            tooltip = false;
          };

          "sway/window" = {
            max-length = 80;
            tooltip = false;
          };

          "clock" = {
            format = "{:%d/%m/%y - %H:%M}";
            tooltip = false;
          };

          "cpu" = {
            format = "  {usage}%";
            interval = 1;
          };

          "memory" = {
            format = "$$ {}%";
          };

          "pulseaudio" = {
            format = "{icon}  {volume}%";
            format-muted = "";
            format-icons = {
              default = [
                ""
                ""
                ""
              ];
            };
            scroll-step = 5;
            on-click = "alacritty -e pulsemixer";
            tooltip = false;
          };

          "network" = {
            format = "{icon}  {ipaddr}/{cidr}";
            format-icons = {
              wifi = [
                ""
                ""
                ""
              ];
              disconnected = [ "💀" ];
            };
            on-click = "alacritty -e nmtui";
            tooltip = false;
          };

          "battery" = {
            format = "{icon}  {capacity}%";
            format-alt = "{icon} {time}";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
            format-charging = " {capacity}%  ";
            interval = 1;
            states = {
              warning = 30;
              critical = 10;
            };
            tooltip = false;
          };

          "tray" = {
            icon-size = 18;
          };

          # Arrow separators - using powerline glyphs
          "custom/arrow1" = {
            format = " ";
            tooltip = false;
          };

          "custom/arrow2" = {
            format = "";
            tooltip = false;
          };

          "custom/arrow3" = {
            format = "";
            tooltip = false;
          };

          "custom/arrow4" = {
            format = "";
            tooltip = false;
          };

          "custom/arrow5" = {
            format = "";
            tooltip = false;
          };

          "custom/arrow6" = {
            format = "";
            tooltip = false;
          };
        };
      };
    };
  };

  home-manager.users.yawd.home.file.".config/waybar/style.css".source = ./style.css;
}
