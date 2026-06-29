{ self, ... }: {

  flake.nixosModules.clang = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      gcc
      mpi
    ];
  };

}



