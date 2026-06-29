{ self, ... }: {

  flake.homeModules.lutris = { pkgs, ... }: {
    programs.lutris = {
      enable = true;

      package = (pkgs.lutris.override {
        buildFHSEnv = args: pkgs.buildFHSEnv (args // {
          multiPkgs = envPkgs:
            let
              originalPkgs = args.multiPkgs envPkgs;
              customLdap = envPkgs.openldap.overrideAttrs (_: { doCheck = false; });
            in
              builtins.filter (p: (p.pname or "") != "openldap") originalPkgs ++ [ customLdap ];
        });
      });

      winePackages = with pkgs; [
        wine-wayland
      ];
      
      protonPackages = with pkgs; [ 
        proton-ge-bin
        dwproton-bin
      ];
    };
  };

}
      

