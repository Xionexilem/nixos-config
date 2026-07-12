{ self, inputs, ... }: {
	
	flake.nixosModules.deathConfiguration = { config, pkgs, lib, ... }: {

		nixpkgs.config.allowUnfree = true;

		imports = with self.nixosModules; [
			deathHardware
			niri
			kde
			myHomeManager
			nh
			nvidia
			docker
			media
			bluetooth
			flatpak
			tailscale
			dev
			cuda
		];

		boot.loader.systemd-boot.enable = true;
		boot.loader.efi.canTouchEfiVariables = true;

		nix.settings.experimental-features = [ "nix-command" "flakes" ];

		networking.hostName = "death";

		networking.networkmanager.enable = true;

		time.timeZone = "Asia/Yekaterinburg";

		i18n.defaultLocale = "ru_RU.UTF-8";

		i18n.extraLocaleSettings = {
			LC_ADDRESS = "ru_RU.UTF-8";
			LC_IDENTIFICATION = "ru_RU.UTF-8";
			LC_MEASUREMENT = "ru_RU.UTF-8";
			LC_MONETARY = "ru_RU.UTF-8";
			LC_NAME = "ru_RU.UTF-8";
			LC_NUMERIC = "ru_RU.UTF-8";
			LC_PAPER = "ru_RU.UTF-8";
			LC_TELEPHONE = "ru_RU.UTF-8";
			LC_TIME = "ru_RU.UTF-8";
		};

		services.xserver.enable = true;

		services.displayManager.sddm.enable = true;

		services.xserver.xkb = {
			layout = "us,ru";
			variant = "";
			options = "grp:alt_shift_toggle";
		};

		services.printing.enable = true;

		services.pulseaudio.enable = false;
		security.rtkit.enable = true;
		services.pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
		};

		services.power-profiles-daemon.enable = true;

		users.users.levm = {
			isNormalUser = true;
			description = "Lev Mitrakov";
			extraGroups = [ "networkmanager" "wheel" ];
			shell = pkgs.zsh;
			packages = with pkgs; [
			];
		};

		home-manager.users.levm = self.homeModules.levmModule;

		services.displayManager.autoLogin.enable = false;

		services.upower.enable = true;

		programs.firefox.enable = true;
		programs.zsh.enable = true;

		environment.systemPackages = with pkgs; [
			git
			wget
			neovim
			firefox
		];

		system.stateVersion = "26.05";

	};

}
