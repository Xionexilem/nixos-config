{ self, ... }: {

  flake.homeModules.yazi = { lib, pkgs, ... }: {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;

      settings = lib.importTOML ./yazi/yazi.toml;
      keymap = lib.importTOML ./yazi/keymap.toml;
      theme = lib.importTOML ./yazi/theme.toml;
      
      plugins = {
        git = pkgs.yaziPlugins.git;
        drag = pkgs.yaziPlugins.drag;
        sudo = pkgs.yaziPlugins.sudo;
        chmod = pkgs.yaziPlugins.chmod;
        mediainfo = pkgs.yaziPlugins.mediainfo;
        office = pkgs.yaziPlugins.office;
        ouch = pkgs.yaziPlugins.ouch;
        relative-motions = pkgs.yaziPlugins.relative-motions;
        vcs-files = pkgs.yaziPlugins.vcs-files;
        full-border = pkgs.yaziPlugins.full-border;
      };

      initLua = builtins.readFile ./yazi/init.lua;

    };
  };

}

