{ self, ... }: {

  flake.nixosModules.gpu = { ... }: {
    imports = with self.nixosModules; [
      nvidia
    ];
  };

}
