{ self, inputs, lib, ... }:
let
  toggles = (import ../../toggles.nix) { };
  pickActive = toggles: modules:
    lib.flatten (lib.mapAttrsToList
      (name: enabled:
        if enabled && modules ? ${name} then [ modules.${name} ] else [ ])
      toggles);
in {
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
    imports = [ self.homeModules.packages ] ++ pickActive toggles self.homeModules;

    home.stateVersion = "26.05";
  };

}

