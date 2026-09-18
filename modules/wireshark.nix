{ ... }: {

  flake.nixosModules.wireshark = { pkgs, ... }: {
    programs.wireshark = {
      enable = true;
      package = pkgs.tshark;
    };
  };

}
