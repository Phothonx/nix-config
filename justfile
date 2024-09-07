rebuild:
  unbuffer nixos-rebuild build --json -v --show-trace --flake . |& nom --json && nvd diff /run/current-system result

gc:
  nix-collect-garbage --delete-older-than 3d
