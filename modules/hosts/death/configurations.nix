{ self, ... }:
{
  flake.nixosModules.deathConfiguration = { config, pkgs, ... }: {
    imports = with self.nixosModules; [ deathImports ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxKernel.packages.linux_7_2;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    networking.hostName = "death";
    networking.networkmanager.enable = true;

    time.timeZone = "Asia/Yekaterinburg";

    i18n.defaultLocale = "ru_RU.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };

    services.xserver.enable = true;

    services.displayManager = {
      defaultSession = "niri";
      ly = {
        enable = true;
        settings = {
          animation = "matrix";
          animation_timeout_sec = 0;

          bg = "0x00000000";
          fg = "0x00FFFFFF";
          border_fg = "0x00FFFFFF";
          error_fg = "0x01FF0000";

          box_title = " Login ";

          cmatrix_fg = "0x0000FF00";
          cmatrix_head_col = "0x01FFFFFF";

          clear_password = true;
          default_input = "login";
          full_color = true;
        };
      };
    };

    services.xserver.xkb = {
      layout = "us,ru";
      variant = "";
      options = "grp:alt_shift_toggle";
    };

    services.printing.enable = true;
    services.power-profiles-daemon.enable = true;

    users.users.tsst = {
      isNormalUser = true;
      description = "Twenty-Seventh Unknown";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [ ];
    };

    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri-wrapped-death;
    };

    home-manager.users.tsst = {
      imports = [ self.homeModules.tsstModule ];
    };

    services.upower.enable = true;

    nixpkgs.config.allowUnfree = true;

    programs.firefox.enable = true;
    programs.zsh.enable = true;

    system.stateVersion = "26.11";

  };

}
