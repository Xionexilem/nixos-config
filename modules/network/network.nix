{ self, ... }: {

  flake.nixosModules.network = { pkgs, ... }: {
    imports = with self.nixosModules; [
      firewall-tg
      firewall
      dns
      tailscale
      v2ray
    ];

    environment.systemPackages = with pkgs; [ ];
  };

}
