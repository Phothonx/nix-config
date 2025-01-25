{
  outputs,
  inputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      inputs.nur.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };
}
