{ self, ... }: {

  flake.homeModules.onlyoffice = { pkgs, ... }: {
    home.packages = [ pkgs.onlyoffice-desktopeditors ];
  };

}
      

