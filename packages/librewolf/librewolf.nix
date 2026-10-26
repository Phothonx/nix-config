# LibreWolf with our overrides baked in. The same two files work on Windows,
# see the header of librewolf.overrides.cfg.
# Policies : about:policies#documentation, https://mozilla.github.io/policy-templates/
# Prefs    : about:config, LibreWolf defaults in about:support -> librewolf.cfg
{lib, ...}: {
  perSystem = {pkgs, ...}: {
    packages.librewolf = pkgs.wrapFirefox pkgs.librewolf-unwrapped {
      libName = "librewolf";

      # appended after LibreWolf's own librewolf.cfg, so ours win
      extraPrefsFiles = pkgs.librewolf-unwrapped.extraPrefsFiles ++ ["${./librewolf.overrides.cfg}"];

      # wrapFirefox merges policy *files* with the earliest one winning, which
      # would let LibreWolf's policies.json override ours ("*": allowed,
      # uBlock normal_installed). extraPolicies is the base layer and wins.
      extraPolicies = (lib.importJSON ./policies.json).policies;
      inherit (pkgs.librewolf-unwrapped) extraPoliciesFiles;
    };
  };
}
