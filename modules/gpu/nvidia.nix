{ self, ... }: {

  flake.nixosModules.nvidia = { lib, pkgs, config, ... }: {
    nixpkgs.config.allowUnfree = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    environment.systemPackages = with pkgs; [
      libGL
      vulkan-loader
      vulkan-tools
      mesa-demos
    ];
  };

}

