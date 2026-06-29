{ self, ... }: {

  flake.homeModules.wallpaperengine = { pkgs, ... }: {
    services.linux-wallpaperengine = {
      enable = true;
      package = pkgs.linux-wallpaperengine;
      wallpapers = [
        {
          monitor = "DP-1";
          wallpaperId = "2884796594";
        }
        {
          monitor = "DP-2";
          wallpaperId = "3430398907";
        }
      ];
    };
  };

}
      

