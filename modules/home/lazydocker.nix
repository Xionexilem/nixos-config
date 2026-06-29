{ self, ... }: {

  flake.homeModules.lazydocker = { ... }: {
    programs.lazydocker = {
      enable = true;
    };
  };

}

