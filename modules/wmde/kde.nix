{ self, ... }: {

  flake.nixosModules.kde = { pkgs, ... }: {
    environment.systemPackages = with pkgs.kdePackages; [
      plasma-integration
      xdg-desktop-portal-kde
    ];
  };

}