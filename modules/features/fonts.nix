{ self, ... }: {

  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      nerd-fonts.fira-code
    ];

    fonts.fontconfig.defaultFonts = {
      monospace = [ "FiraCode Nerd Font Propo" "Noto Sans Mono" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };

}
