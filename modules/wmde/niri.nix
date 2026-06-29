{ self, inputs, ... }: {

  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input = {
          keyboard = {
            xkb = {
              layout = "us,ru";
              options = "grp:alt_shift_toggle";
            };
          };

          touchpad = {
            tap = _: {};
          };
        };

        layout = {
          gaps = 5;
          preset-column-widths = [
            {
              proportion = 0.5;
            }
            {
              proportion = 0.666667;
            }
            {
              proportion = 1.0;
            }
          ];
          preset-window-heights = [
            {
              proportion = 0.5;
            }
            {
              proportion = 1.0;
            }
          ];
        };

        prefer-no-csd = _: {};

        outputs = {
          "DP-1" = {
            mode = "1920x1080@144.002";
            position = _: {
              props = {
                x = 0;
                y = 650;
              };
            };
            focus-at-startup = _: {};
          };

          "DP-2" = {
            mode = "1920x1080@144.002";
            transform = "90";
            position = _: {
              props = {
                x = 1920;
                y = 0;
              };
            };
            layout = {
              default-column-width = { proportion = 1.0; };
              preset-column-widths = [
                {
                  proportion = 1.0;
                }
              ];
            };
          };
        };

        binds = {
          # Launcher & apps
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+M".spawn-sh = "${lib.getExe pkgs.kitty} yazi";

          # Close & screenshot
          "Mod+Q".close-window = _: {};
          "Mod+Shift+S".screenshot = _: {};

          # Focus navigation
          "Mod+K".focus-window-up = _: {};
          "Mod+J".focus-window-down = _: {};
          "Mod+H".focus-column-left = _: {};
          "Mod+L".focus-column-right = _: {};
          "Mod+Shift+K".focus-workspace-up = _: {};
          "Mod+Shift+J".focus-workspace-down = _: {};

          # Window state
          "Mod+F".maximize-column = _: {};
          "Mod+Shift+F".fullscreen-window = _: {};
          "Mod+Ctrl+H".switch-preset-window-height = _: {};
          "Mod+Ctrl+V".switch-preset-column-width = _: {};

          # Move windows & columns
          "Mod+Alt+K".move-window-up = _: {};
          "Mod+Alt+J".move-window-down = _: {};
          "Mod+Alt+H".move-column-left = _: {};
          "Mod+Alt+L".move-column-right = _: {};
          "Mod+Ctrl+K".move-column-to-workspace-up = _: {};
          "Mod+Ctrl+J".move-column-to-workspace-down = _: {};
        };
      };
    };
    
  };

}
