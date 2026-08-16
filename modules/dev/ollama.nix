{ self, ... }: {

  flake.nixosModules.ollama = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      opencode
      qwen-code
    ];

    services.ollama = {
      enable = true;
      package = pkgs.ollama;
    };
  };

}
