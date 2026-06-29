{ self, ... }: {

  flake.nixosModules.miraiSwap = { ... }: {
    swapDevices = [
      { device = "/swapfile"; }
    ];
  };

}

