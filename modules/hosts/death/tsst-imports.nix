{ self, ... }:
{
  flake.homeModules.tsstImports = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    imports = with self.homeModules; [

      # - shell -
      zsh

      # - terminal -
      kitty

      # - tools -
      git
      zoxide

      # - file manager -
      yazi

      # - code editor -
      nvim

      # - visual style -
      cursor

      # - sound -
      easyeffects

      # - media -
      mpv

      # - office -
      onlyoffice

      # - games -
      lutris

    ];

    home.packages = with pkgs; [

      # - network -
      nftables

      # - tools -
      htop
      fastfetch
      binutils
      pciutils
      unzip
      unrar-free
      p7zip
      ouch
      gnumake
      zathura

      # - note -
      obsidian

      # - messenger -
      telegram-desktop

      # - voip -
      discord

      # - torrent -
      qbittorrent-enhanced

      # - music -
      yandex-music

      # - games -
      wineWow64Packages.waylandFull
    ];

  };
}
