{ ... }: {

  flake.nixosModules.suricata = { ... }: {
    services.suricata = {
      enable = true;

      enabledSources = [
        "et/open"
      ];

      settings = {
        vars = {
          address-groups = {
            HOME_NET = "[192.168.1.0/24]";
            EXTERNAL_NET = "!$HOME_NET";

            DNS_SERVERS = "$HOME_NET";
            HTTP_SERVERS = "$HOME_NET";
            SMTP_SERVERS = "$HOME_NET";
            SQL_SERVERS = "$HOME_NET";
            TELNET_SERVERS = "$HOME_NET";
          };
        };

        host-mode = "sniffer-only";

        af-packet = [
          {
            interface = "enp6s0";

            cluster-id = 99;
            cluster-type = "cluster_flow";

            defrag = "yes";
            use-mmap = "yes";

            tpacket-v3 = "yes";
          }
        ];

        default-rule-path = "/var/lib/suricata/rules";
        rule-files = [
          "suricata.rules"
        ];

        stats = {
          enabled = "yes";
          interval = 8;
        };

        outputs = [
          {
            eve-log = {
              enabled = "yes";
              filetype = "regular";
              filename = "eve.json";
              community-id = true;
            };
          }
        ];
      };
    };
  };

}
