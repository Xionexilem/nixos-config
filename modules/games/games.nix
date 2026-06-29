{ self, ... }: {

  flake.nixosModules.games = { pkgs, ... }: {
    imports = with self.nixosModules; [
      steam
      gamescope
    ];

    environment.systemPackages = with pkgs; [
      winetricks
      protontricks
    ];
  };

}


