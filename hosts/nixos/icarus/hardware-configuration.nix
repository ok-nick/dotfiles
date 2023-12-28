{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.availableKernelModules = ["xhci_pci" "nvme" "usbhid" "rtsx_pci_sdmmc"];
    kernelModules = ["kvm-intel"];
    blacklistedKernelModules = ["dell_smbios"]; # for some reason this is installed and always errors

    resumeDevice = "/dev/disk/by-label/linux";
    kernelParams = [
      "resume_offset=6891656"
      "button.lid_init_state=open" # fixes bug causing random suspension after resumption
    ];

    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
  };

  # TODO: https://github.com/nix-community/disko
  fileSystems = let
    label = "linux";
  in {
    "/" = {
      device = "/dev/disk/by-label/${label}";
      fsType = "btrfs";
      options = ["subvol=@" "compress=zstd" "noatime"];
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-label/${label}";
      fsType = "btrfs";
      options = ["subvol=@nix" "compress=zstd" "noatime"];
    };

    "/persist" = {
      device = "/dev/disk/by-label/${label}";
      fsType = "btrfs";
      options = ["subvol=@persist" "compress=zstd" "noatime"];
      neededForBoot = true;
    };

    "/swap" = {
      device = "/dev/disk/by-label/${label}";
      fsType = "btrfs";
      options = ["subvol=@swap" "noatime"];
    };
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 16384;
    }
  ];

  hardware = {
    cpu.intel.updateMicrocode = true;

    nvidia.prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
