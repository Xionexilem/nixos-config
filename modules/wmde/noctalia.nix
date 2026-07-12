{ self, inputs, ... }: {

  perSystem = { pkgs, ... }: {
    packages = {
      myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings =
          (builtins.fromJSON
            (builtins.readFile ./noctalia-mirai.json)).settings;
      };

      myNoctaliaDeath = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings =
          (builtins.fromJSON
            (builtins.readFile ./noctalia-death.json)).settings;
      };
    };
  };

}
