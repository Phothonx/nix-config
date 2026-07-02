{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    # Bake a keymap so `d` deletes permanently instead of moving files to the
    # freedesktop trash (which litters a .Trash-<uid> dir on every mount).
    # prepend_keymap merges with yazi's defaults, so every other key still works.
    yaziConfigHome = pkgs.writeTextDir "keymap.toml" ''
      [mgr]
      prepend_keymap = [
        { on = "d", run = "remove --permanently", desc = "Delete permanently" },
      ]
    '';
  in {
    packages.yazi = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;

      package = pkgs.yazi;
      env = {
        YAZI_CONFIG_HOME = "${yaziConfigHome}";
      };
    };
  };
}