{ self, ... }: {

  flake.nixosModules.nh = { ... }: {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
  };

}
