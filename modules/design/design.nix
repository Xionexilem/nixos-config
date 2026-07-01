{ self, ... }: {

  flake.nixosModules.design = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      gimp-with-plugins
      blender
      blockbench
    ];
  };

  flake.homeModules.design = { ... }: { };
}



