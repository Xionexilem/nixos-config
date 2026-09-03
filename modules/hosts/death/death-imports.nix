{ self, ... }: {

  flake.nixosModules.deathImports = { ... }: {

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
      fonts
    ];

  };

}
