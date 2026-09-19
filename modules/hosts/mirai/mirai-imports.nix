{ self, ... }: {

  flake.nixosModules.miraiImports = { pkgs, ... }: {

    imports = with self.nixosModules; [

      # - main -
      miraiHardware
      miraiSwap
      myHomeManager
      nh

      # - gpu -
      nvidia

      # - network -
      dns
      firewall-tg
      firewall

      # - server -
      # empty

      # - sound -
      pipewire

      # - security -
      # empty

      # - virtualisation -
      docker

      # - window manager -
      niri
      kde

      # - visual style -
      fonts

      # - package manager -
      flatpak

      # - dev -
      clang
      jdk
      npm
      python
      rust

      # - media -
      # empty

      # - games -
      gamescope
      steam

    ];

    environment.systemPackages = with pkgs; [

      # - security -
      openssl
      nmap

      # - media -
      kew
      ffmpeg

      # - design -
      blender
      blockbenck
      gimp-with-plugins

      # - games -
      winetricks
      protontricks

    ];
  };

}
