{ self, ... }:
let
  ymPkg = self.packages.x86_64-linux.myYandexMusic;
in {
  flake.homeModules.packages = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      telegram-desktop
      qbittorrent-enhanced
      htop
      fastfetch
      binutils
      nftables
      pciutils
      ymPkg
      wineWow64Packages.waylandFull
      discord
      unzip
      unrar-free
      p7zip
      ouch
      zathura
      gnumake
    ];
  };

}
      

