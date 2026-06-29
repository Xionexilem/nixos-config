{ self, ... }: {

  flake.homeModules.zoxide = { config, pkgs, ... }: {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

}
      


