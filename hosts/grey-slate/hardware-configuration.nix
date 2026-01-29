{
  flake.nixosModules.hostGreySlate = {
    config,
    lib,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/3d7a9a25-85dd-4070-a3a6-4c36cc90719b";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/F1C1-FC25";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
    };

    swapDevices = [
      { device = "/dev/disk/by-uuid/ef5894e0-0c2f-4038-adce-f0c5a5aaca1a"; }
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
