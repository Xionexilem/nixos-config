{ self, ... }: {

  flake.nixosModules.firewall-tg = { pkgs, ... }: {
    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [ 1443 ];
    networking.firewall.extraCommands = ''
      ${pkgs.iptables}/bin/iptables -I INPUT -p tcp -s 192.168.0.0/24 --dport 1443 -j ACCEPT
    '';
  };

}


