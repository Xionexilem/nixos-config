{ ... }: {

  flake.nixosModules.firewall = { pkgs, ... }: {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 10000 ];
      extraInputRules = ''
        -A nixos-fw -s 192.168.0.0/24 -p tcp -m tcp --dport 10000 -j nixos-fw-accept
        -A nixos-fw -s 192.168.0.0/24 -p udp -m udp --dport 10000 -j nixos-fw-accept
      '';
    };
  };

}
