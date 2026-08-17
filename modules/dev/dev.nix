{ self, ... }: {

  flake.nixosModules.dev = { ... }: {
    imports = with self.nixosModules; [
      python
      clang
      jdk
      rust
      npm
    ];
  };

}

