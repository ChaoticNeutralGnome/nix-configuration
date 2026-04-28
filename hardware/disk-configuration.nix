{
  disko.devices = {
    disk = {
      # 500GB SSD (system)
      ssd = {
        device = "/dev/sda"; 
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                mountOptions = [ "compress=zstd" "noatime" ];
                subvolumes = {
                  "@root" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "@swap" = {
                    mountpoint = "/.swapvol";
                    swap {
                      swap.swapfile.size = "16G";
                    }
                  };
                };
              };
            };
          };
        };
      };

      # 500GB NVMe (fast storage)
      nvme = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            fast = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                mountOptions = [ "compress=zstd" "noatime" ];
                mountpoint = "/fast";
              };
            };
          };
        };
      };

      # 1TB HDD (bulk storage)
      hdd = {
        device = "/dev/sdb";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                mountOptions = [ "compress=zstd" "noatime" ];
                mountpoint = "/data";
              };
            };
          };
        };
      };
    };
  };
}