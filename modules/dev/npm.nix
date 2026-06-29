{ self, ... }: {

  flake.nixosModules.npm = { ... }: {
    programs.npm = {
      enable = true;
    };
  };

}

