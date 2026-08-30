{ ... }: {

  flake.homeModules.cursor = { pkgs, ... }: {
    home = {
      pointerCursor = {
        enable = true;

        package = pkgs.vimix-cursors;
        name = "Vimix-cursors";
        size = 24;

        gtk.enable = true;
        x11.enable = true;
      };

      sessionVariables = {
        XCURSOR_THEME = "Vimix-cursors";
        XCURSOR_SIZE = "24";
      };
    };
  };

}
