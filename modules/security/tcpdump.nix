{ ... }: {

  flake.nixosModules.tcpdump = { ... }: {
    programs.tcpdump.enable = true;
  };

}
