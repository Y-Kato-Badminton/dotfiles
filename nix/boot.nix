{ config, pkgs, lib, ... }:
{
  # Use the systemd-boot EFI boot loader.
  boot = {
    blacklistedKernelModules = [ "snd_pcsp" "pcspkr" ];
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth.enable = true;
    supportedFilesystems = [ "xfs" "zfs" ];
    kernel = {
      sysctl = {
        "kernel.perf_event_paranoid" = 0;
      };
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        version = 2;
        device = "nodev";
        efiSupport = true;
        gfxmodeEfi = "1024x768";
        zfsSupport = true;
      };
    };
    initrd = {
      kernelModules = [
        "dm_mod"
        "dm-crypt"
        "ext4"
        "ecb"
      ];
      luks.devices = [
        {
          name = "root";
          device = "/dev/nvme0n1p2";
          preLVM = true;
          allowDiscards = true;
        }
      ];
    };
  };
}
