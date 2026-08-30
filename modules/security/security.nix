{ self, ... }: {

  flake.nixosModules.security = { pkgs, ... }: {
    imports = with self.nixosModules; [
      wireshark
      tcpdump
      audit
    ];

    environment.systemPackages = with pkgs; [
      openssl
      nmap
      lynis
      clamav
      zeek
      nikto
      nuclei
      ffuf
      gobuster
    ];
  };

}
