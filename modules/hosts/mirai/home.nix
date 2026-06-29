{ self, inputs, ... }: {

  flake.homeConfigurations.levm = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.levmModule
      {
        home.username = "levm";
        home.homeDirectory = "/home/levm";
      }
    ];
  };

  flake.homeModules.levmModule = { pkgs, ... }: {
    imports = with self.homeModules; [
      packages
      sound
      media
      browser
      git
      zsh
      kitty
      zoxide
      yazi
      wallpaperengine
      lutris
      retroarch
      lazydocker
      onlyoffice
    ];

    home.stateVersion = "26.05";
  };

}

