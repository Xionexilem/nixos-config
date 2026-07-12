{ self, inputs, lib, ... }:
let
  toggles = (import ../../toggles.nix) { };
  pickActive = toggles: modules:
    lib.flatten (lib.mapAttrsToList
      (name: enabled:
        if enabled && modules ? ${name} then [ modules.${name} ] else [ ])
      toggles);
in {
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
