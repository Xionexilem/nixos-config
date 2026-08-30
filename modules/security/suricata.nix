{ ... }: {

  flake.nixosModules.suricata = { ... }: {
    services.suricata.enable = true;
  };

}
