{ self, ... }: {

  flake.nixosModules.sound = { ... }: {
    imports = with self.nixosModules; [ pipewire ];
  };

  flake.homeModules.sound = { ... }: {
    imports = with self.homeModules; [ easyeffects ];
  };

}


