{ self, ... }: {

  flake.nixosModules.deathHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports =
      [ (modulesPath + "/installer/scan/not-detected.nix")
      ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/0be1c755-4fcc-4075-882b-cb08fb49457c";
	fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/1020-A14D";
	fsType = "vfat";
	options = [ "fmask=0022" "dmask=0022" ];
      };

    fileSystems."/home" =
      { device = "/dev/disk/by-uuid/0c6e05cf-1245-475d-99e4-e3d9c6b430bf";
	fsType = "ext4";
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/ee9624bd-6fed-46f4-bfe3-a93b7c720028"; }
      ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

}
