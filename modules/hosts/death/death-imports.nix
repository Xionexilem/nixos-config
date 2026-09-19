{ self, ... }: {

  flake.nixosModules.deathImports = { pkgs, ... }: {

    imports = with self.nixosModules; [

      # - main -
      deathHardware
      myHomeManager
      nh

      # - gpu -
      nvidia

      # - network -
      dns
      firewall-tg
      firewall
      bluetooth

      # - server -
      openssh
      plantuml

      # - sound -
      pipewire

      # - security -
      # empty

      # - virtualisation -
      docker

      # - window manager -
      niri

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
      # empty

    ];

    environment.systemPackages = with pkgs; [

      # - security -
      openssl

      # - media -
      kew
      ffmpeg

      # - games -
      winetricks
      protontricks

    ];
  };

}
