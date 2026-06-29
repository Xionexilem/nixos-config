{ self, ... }: {

  flake.homeModules.retroarch = { pkgs, ... }: {
    programs.retroarch = {
      
      enable = true;
      
      settings = {
        netplay_nickname = "username";
        video_driver = "vulkan";
      };

      cores = {
        mesen = {
          enable = true;
        };
      };

    };
  };

}
      


