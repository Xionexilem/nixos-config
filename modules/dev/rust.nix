{ self, ... }: {

  flake.nixosModules.rust = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      rustc
      cargo
      rust-analyzer
    ];
  };

}

