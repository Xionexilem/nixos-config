{ self, ... }: {

  flake.homeModules.mpv = { ... }: {
    programs.mpv = {
      enable = true;
    };
  };

}
      


