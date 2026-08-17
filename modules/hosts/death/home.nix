{ self, inputs, ... }:
{
  flake.homeConfigurations.death = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.levmModule
      {
        home.username = "levm";
        home.homeDirectory = "/home/levm";
      }
    ];
  };
}
