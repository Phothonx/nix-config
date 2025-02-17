{
  outputs,
  inputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      inputs.nur.overlays.default
      inputs.my-shell.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };
}
