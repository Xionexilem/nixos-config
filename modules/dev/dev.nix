{ ... }: {

  flake.nixosModules.dev = { self, pkgs, ... }: {
    imports = with self.nixosModules; [
      python
      clang
      jdk
      rust
      npm
    ];

    environment.systemPackages = with pkgs; [
      opencode
    ];
  };

}
