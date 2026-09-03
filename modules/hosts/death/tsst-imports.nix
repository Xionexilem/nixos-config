{ self, ... }:
{
  flake.homeModules.tsstImports = { ... }: {
    imports = with self.homeModules; [
      packages
      git
      zsh
      nvim
      zoxide
      kitty
      yazi
      cursor
      sound
      media
      browser
      lutris
      onlyoffice
    ];
  };
}
