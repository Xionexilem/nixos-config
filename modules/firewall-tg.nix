{ ... }: {

  flake.nixosModules.firewall-tg = { pkgs, ... }: {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 1443 ];
      extraCommands = ''
        ${pkgs.iptables}/bin/iptables -I INPUT -p tcp -s 192.168.0.0/24 --dport 1443 -j ACCEPT
      '';
    };
  };

}
