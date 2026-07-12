{ self, inputs, ... }: {

	flake.nixosConfigurations.death = inputs.nixpkgs.lib.nixosSystem {
		modules = [
			self.nixosModules.deathConfiguration
		];
	};

}
