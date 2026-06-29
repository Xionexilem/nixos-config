{ self, ... }: {

  flake.nixosModules.network = { ... }: {
    imports = with self.nixosModules; [
      firewall-tg
      dns
      tailscale
    ];
  };

}

