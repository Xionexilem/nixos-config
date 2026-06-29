{ self, ... }: {

  flake.homeModules.git = { ... }: {
    programs.git = {
      enable = true;
      settings.user = {
        email = "lev.mitrakov@bk.ru";
        name = "Xionexilem";
      };
    };
  };

}
      
