{ self, ... }: {

  flake.nixosModules.browser = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      brave
    ];
  };

  flake.homeModules.browser = { ... }: {
    imports = with self.homeModules; [ qutebrowser ];
  };

}

