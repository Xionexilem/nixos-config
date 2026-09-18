{ ... }: {

  flake.nixosModules.plantuml = { pkgs, ... }: {
    services.plantuml-server = {
      enable = true;
      listenPort = 8081;
      listenHost = "0.0.0.0";
    };
  };

}
