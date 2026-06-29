{ self, ... }: {

  flake.nixosModules.jdk = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      jdk
    ];
  };

}
