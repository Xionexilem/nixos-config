{ ... }: {

  flake.nixosModules.v2ray = { pkgs, ... }: {
    services.v2raya = {
      enable = true;

      cliPackage = pkgs.xray;
    };
  };

}
