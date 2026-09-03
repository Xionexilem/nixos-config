{ self, ... }:
{
  flake.nixosModules.deathConfiguration =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      imports = with self.nixosModules; [
        deathHardware
        myHomeManager
        sound
        wmde
        gpu
        network
        browser
        security
        nh
        flatpak
        virtualisation
        dev
        media
        bluetooth
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelPackages = pkgs.linuxKernel.packages.linux_7_1;

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

      environment.systemPackages = with pkgs; [
        where-is-my-sddm-theme
      ];

      services.displayManager.sddm = {
        enable = true;
        extraPackages = with pkgs; [
          where-is-my-sddm-theme
        ];
        theme = "where_is_my_sddm_theme";
      };

      services.xserver.xkb = {
        layout = "us,ru";
        variant = "";
        options = "grp:alt_shift_toggle";
      };

      services.printing.enable = true;
      services.power-profiles-daemon.enable = true;

      users.users.levm = {
        isNormalUser = true;
        description = "Lev Mitrakov";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
        packages = with pkgs; [ ];
      };

      services.ollama.enable = lib.mkForce false;

      programs.niri.package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri-wrapped-death;

      services.upower.enable = true;

      nixpkgs.config.allowUnfree = true;

      programs.firefox.enable = true;
      programs.zsh.enable = true;

      system.stateVersion = "26.11";

    };

}
