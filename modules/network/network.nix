{ self, ... }: {

  flake.nixosModules.network = { pkgs, ... }: {
    imports = with self.nixosModules; [
      firewall-tg
      dns
      tailscale
      v2ray
    ];

    environment.systemPackages = with pkgs; [ ];
  };

}
