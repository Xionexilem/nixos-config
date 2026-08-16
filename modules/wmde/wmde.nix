{ self, ... }: {

  flake.nixosModules.wmde = { ... }: {
    imports = with self.nixosModules; [
      niri
    ];
  };

}

