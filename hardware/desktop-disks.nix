{ config, ...} :  {
    fileSystems."/" =
        { device = "/dev/disk/by-uuid/41561b0d-d78e-407d-a3ba-d355e77abf46";
        fsType = "btrfs";
        options = [ "subvol=@root" ];
        };

    fileSystems."/.swapvol" =
        { device = "/dev/disk/by-uuid/41561b0d-d78e-407d-a3ba-d355e77abf46";
        fsType = "btrfs";
        options = [ "subvol=@swap" ];
        };

    fileSystems."/home" =
        { device = "/dev/disk/by-uuid/41561b0d-d78e-407d-a3ba-d355e77abf46";
        fsType = "btrfs";
        options = [ "subvol=@home" ];
        };

    fileSystems."/fast" =
        { device = "/dev/disk/by-uuid/af713576-a6c0-4297-a583-6feb02694bc9";
        fsType = "btrfs";
        };

    fileSystems."/data" =
        { device = "/dev/disk/by-uuid/c20e0a38-2e8b-4e6b-ad73-c903cbe41d5a";
        fsType = "btrfs";
        };

    fileSystems."/boot" =
        { device = "/dev/disk/by-uuid/6746-1633";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
        };

    swapDevices = [ { device = "/.swapvol/swapfile"; } ];
}