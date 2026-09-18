{ ... }: {

  flake.nixosModules.openssh = { ... }: {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    users.users.tsst = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILluqRs1cUARlOxrAy4Ymjt1W8lj80OXMGbaPHV0k0EL lev.mitrakov@bk.ru"
      ];
    };
  };

}
