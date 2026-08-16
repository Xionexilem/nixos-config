{ self, ... }: {

  flake.homeModules.kitty = { ... }: {
    programs.kitty = {
      enable = true;
      themeFile = "ayu";
      font = {
        name = "FiraCode Nerd Font Mono";
        size = 11;
      };
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
      

