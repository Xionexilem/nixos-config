{ self, ... }: {

  flake.nixosModules.browser = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      wget
    ];
  };

  flake.homeModules.browser = { ... }: {
    imports = with self.homeModules; [ qutebrowser ];
  };

}

