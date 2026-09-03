{ self, ... }:
{
  flake.homeModules.levmImports = { ... }: {
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
      design
      browser
      lutris
      retroarch
      onlyoffice
    ];
  };
}
