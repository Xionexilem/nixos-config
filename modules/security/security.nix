{ self, ... }: {

  flake.nixosModules.security = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      openssl
      nmap
      wireshark
    ];
  };

}

