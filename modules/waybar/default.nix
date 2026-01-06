{ ... }:
{
  home-manager.users.yawd = {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 34;
          spacing = 4;

          modules-left = [
            "sway/workspaces"
            "sway/mode"
            "cpu"
            "memory"
          ];
          modules-center = [ "clock" ];
          modules-right = [
            "backlight"
            "pulseaudio"
            "network"
            "battery"
            "tray"
          ];

          # Module Specific Configurations
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            format = "{name}: {icon}";
            format-icons = {
              "1" = "";
              "2" = "";
              "3" = "";
              "urgent" = "";
              "focused" = "";
              "default" = "";
            };
          };

          "clock" = {
            format = " {:%H:%M   %d/%m}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };

          "cpu" = {
            format = " {usage}%";
            tooltip = false;
          };

          "memory" = {
            format = " {}%";
          };

          "backlight" = {
            format = "{icon} {percent}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
            ];
          };

          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-muted = "";
            format-icons = {
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "pavucontrol";
          };

          "network" = {
            format-wifi = " {essid}";
            format-ethernet = " {ifname}";
            format-disconnected = "⚠ Disconnected";
          };

          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = " {capacity}%";
            format-plugged = " {capacity}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
          };
        };
      };

      # Basic CSS for a modern look
      style = ''
        * {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 13px;
          border: none;
          border-radius: 0;
        }

        window#waybar {
          background-color: rgba(43, 48, 59, 0.5);
          border-bottom: 3px solid rgba(100, 114, 125, 0.5);
          color: #ffffff;
        }

        #workspaces button {
          padding: 0 5px;
          background-color: transparent;
          color: #ffffff;
        }

        #workspaces button.focused {
          background-color: #64727D;
          border-bottom: 3px solid #ffffff;
        }

        #clock, #battery, #cpu, #memory, #backlight, #network, #pulseaudio, #tray {
          padding: 0 10px;
          margin: 0 4px;
        }

        #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }
      '';
    };
  };
}
