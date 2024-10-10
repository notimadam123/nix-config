{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/vda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                # Subvolumes must set a mountpoint in order to be mounted,
                # unless their parent is mounted
                subvolumes = {
                  # Subvolume name is different from mountpoint
                  "/" = {
                    mountOptions = [ "compress=zstd:1" "noatime" ];
                    mountpoint = "/";
                  };
                  # Subvolume name is the same as the mountpoint
                  "/home" = {
                    mountOptions = [ "compress=zstd:1" "noatime" ];
                    mountpoint = "/home";
                  };
                  # Sub(sub)volume doesn't need a mountpoint as its parent is mounted
                  # Parent is not mounted so the mountpoint must be set
                  "/nix" = {
                    mountOptions = [ "compress=zstd:2" "noatime" ];
                    mountpoint = "/nix";
                  };
                  # This subvolume will be created but not mounted
                  # Subvolume for the swapfile
                };
              };
            };
          };
        };
      };
    };
  };
}
