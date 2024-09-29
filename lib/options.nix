lib:
with lib; {
  mkOpt = type: default: description:
    mkOption {inherit type default description;};

  mkOpt' = type: default:
    mkOption {inherit type default;};
}
