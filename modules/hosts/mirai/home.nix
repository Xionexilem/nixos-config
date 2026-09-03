{ self, inputs, ... }:
{

  flake.homeConfigurations.levm = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.levmModule
    ];
  };

  flake.homeModules.levmModule = { pkgs, ... }: {
    imports = with self.homeModules; [ levmImports ];

    home = {
      username = "levm";
      homeDirectory = "/home/levm";
      stateVersion = "26.11";
    };
  };

}
