{ self, inputs, ... }: {

  flake.nixosModules.myHomeManager = { lib, pkgs, config, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
