{ self, ... }: {

  flake.homeModules.kitty = { ... }: {
    programs.kitty = {
      enable = true;
      themeFile = "ayu";
      settings = {
        background_opacity = "1";
      };
    };

    xdg.terminal-exec = {
      enable = true;
      settings = {
        default = [ "kitty.desktop" ];
      };
    };
  };

}
      

