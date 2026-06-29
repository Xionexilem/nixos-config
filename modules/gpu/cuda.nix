{ self, ... }: {

  flake.nixosModules.cuda = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      cudatoolkit
    ];
  };

}

