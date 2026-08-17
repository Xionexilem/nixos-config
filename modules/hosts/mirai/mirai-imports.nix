{ self, ... }: {

  flake.nixosModules.miraiImports = { ... }: {

    imports = with self.nixosModules; [
      miraiHardware
      miraiSwap
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
      games
      dev
      media
      design
      fonts
    ];

  };

}


