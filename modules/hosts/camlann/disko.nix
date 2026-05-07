{
  flake.diskoConfigurations.camlann = {
    disko.devices = {
      disk.system = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-CT500P1SSD8_1913E1F56204";

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

            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = ["-L" "nixos" "-f"];
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };

                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };

                  "/persist" = {
                    mountpoint = "/persist";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                  "/swap" = {
                    mountpoint = "/swap";
                    swap.swapfile.size = "24G";
                  };
                };
              };
            };
          };
        };
      };

      disk.data1 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST1000DM010-2EP102_W9AE82JN";

        content = {
          type = "gpt";

          partitions.data = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = ["-L" "data" "-f"];

              subvolumes = {
                "/data" = {
                  mountpoint = "/data";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
              };
            };
          };
        };
      };
    };
  };
}
