{ self, inputs, ... }: {

  flake.nixosConfigurations.mirai = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.miraiConfiguration
    ];
  };

}
