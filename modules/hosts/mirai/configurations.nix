{ self, ... }:
{
  flake.nixosModules.miraiConfiguration = { config, pkgs, ... }: {
    imports = with self.nixosModules; [ miraiImports ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxKernel.packages.linux_7_1;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking.hostName = "mirai";
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
    services.displayManager.sddm.enable = true;
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
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.zsh;
      packages = with pkgs; [ ];
    };

    programs.niri.package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri-wrapped-mirai;

    home-manager.users.levm = {
      imports = [ self.homeModules.levmModule ];
    };

    services.upower.enable = true;

    programs.firefox.enable = true;
    programs.zsh.enable = true;

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.11";

  };

}
