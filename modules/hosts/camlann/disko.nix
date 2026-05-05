{
  flake.diskoConfigurations.camlann = {
    disko.devices = {
      # EMPTY SNAPSHOT after frist boot
      # sudo zfs snapshot zroot/root@blank

      # SYSTEM DISK (SSD)
      disk.system = {
        type = "disk";
        device = "/dev/disk/by-id/<disk-name>";
        content = {
          type = "gpt";
          partitions = {
            esp = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };

            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
        };
      };

      # DATA DISKS (RAID-Z1)
      disk.data1 = {
        type = "disk";
        device = "/dev/disk/by-id/<disk-name>";
        content = {
          type = "gpt";
          partitions.zfs = {
            size = "100%";
            content = {
              type = "zfs";
              pool = "tank";
            };
          };
        };
      };

      # disk.data2 = {
      #   type = "disk";
      #   device = "/dev/disk/by-id/<disk-name>";
      #   content = {
      #     type = "gpt";
      #     partitions.zfs = {
      #       size = "100%";
      #       content = {
      #         type = "zfs";
      #         pool = "tank";
      #       };
      #     };
      #   };
      # };
      #
      # disk.data3 = {
      #   type = "disk";
      #   device = "/dev/disk/by-id/<disk-name>";
      #   content = {
      #     type = "gpt";
      #     partitions.zfs = {
      #       size = "100%";
      #       content = {
      #         type = "zfs";
      #         pool = "tank";
      #       };
      #     };
      #   };
      # };

      # ZFS POOLS
      zpool = {
        # ROOT POOL (SSD)
        zroot = {
          type = "zpool";

          options.ashift = "12";

          rootFsOptions = {
            mountpoint = "none";
            compression = "zstd";
            atime = "off";
            xattr = "sa";
            acltype = "posixacl";
          };

          datasets = {
            root = {
              type = "zfs_fs";
              mountpoint = "/";
            };

            nix = {
              type = "zfs_fs";
              mountpoint = "/nix";
            };

            persist = {
              type = "zfs_fs";
              mountpoint = "/persist";
            };
          };
        };

        # DATA POOL (RAID-Z1)
        tank = {
          type = "zpool";
          # mode = "raidz1";

          options.ashift = "12";

          rootFsOptions = {
            mountpoint = "none";
            compression = "zstd";
            atime = "off";
          };

          datasets = {
            data = {
              type = "zfs_fs";
              mountpoint = "/data";
            };

            backups = {
              type = "zfs_fs";
              mountpoint = "/backups";
            };

            media = {
              type = "zfs_fs";
              mountpoint = "/media";
            };
          };
        };
      };
    };
  };
}
