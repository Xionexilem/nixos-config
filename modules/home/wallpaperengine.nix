{ self, ... }: {

  flake.homeModules.wallpaperengine = { pkgs, ... }: {
    services.linux-wallpaperengine = {
      enable = true;
      package = pkgs.linux-wallpaperengine;
    };
  };

}
      

