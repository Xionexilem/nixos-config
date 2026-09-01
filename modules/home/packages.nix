{ self, ... }: {

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
      yandex-music
      wineWow64Packages.waylandFull
      discord
      unzip
      unrar-free
      p7zip
      ouch
      zathura
      gnumake
      obsidian
    ];
  };

}
