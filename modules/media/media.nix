{ self, ... }: {

  flake.nixosModules.media = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kew
      ffmpeg
    ];
  };

  flake.homeModules.media = { ... }: {
    imports = with self.homeModules; [ mpv ];
  };

}


