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
        "SHA256:aA98cgw0hX5l2ABbSJldSe2PeUSqPjmkbbdH+FClme4 lev.mitrakov@bk.ru"
      ];
    };
  };

}
