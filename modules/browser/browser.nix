{ self, ... }: {

  flake.nixosModules.browser = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ ];
  };

  flake.homeModules.browser = { ... }: {
    imports = with self.homeModules; [ qutebrowser ];
  };

}

