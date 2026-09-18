{ self, ... }: {

  flake.nixosModules.gamescope = { ... }: {
    programs.gamescope = {
      enable = true;
    };
  };

}
      




