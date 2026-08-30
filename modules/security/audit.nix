{ ... }: {

  flake.nixosModules.audit = { ... }: {
    security = {
      auditd = {
        enable = true;

        settings = {
          log_format = "ENRICHED";
          num_logs = 5;
          max_log_file = 50;
          max_log_file_action = "ROTATE";
        };
      };

      audit = {
        enable = true;

        rules = [
          "-w /etc/ssh/sshd_config -p wa -k sshd_config"
          "-w /etc/nixos -p wa -k nixos_config"
          "-w /etc/passwd -p wa -k identity"
          "-w /etc/shadow -p wa -k identity"
          "-w /etc/sudoers -p wa -k privilege"
        ];
      };
    };
  };

}
