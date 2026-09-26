{ self, inputs, ... }:
{

  flake.homeConfigurations.death = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.tsstModule
    ];
  };

  flake.homeModules.tsstModule = { pkgs, ... }: {
    imports = with self.homeModules; [ tsstImports ];

    home = {
      username = "tsst";
      homeDirectory = "/home/tsst";
      stateVersion = "26.11";
    };

    xdg.userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "$HOME/Desktop";
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      publicShare = "$HOME/Public";
      templates = "$HOME/Templates";
      videos = "$HOME/Videos";
    };
  };

}
