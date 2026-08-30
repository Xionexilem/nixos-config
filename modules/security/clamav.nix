{ ... }: {

  flake.nixosModules.clamav = { pkgs, ... }: {
    services.clamav = {
      daemon.enable = true;
      updater.enable = true;
      scanner.enable = true;
    };

    systemd = {
      timers.clamav-scanner = {
        timerConfig = {
          OnCalendar = "*-*-* 04:00:00";
          Persistent = true;
          WakeSystem = true;
        };
      };

      services.clamav-scanner = {
        servicesConfig = {
          ExecStartPost = "${pkgs.systemd}/bin/shutdown now";
        };
      };
    };
  };

}
