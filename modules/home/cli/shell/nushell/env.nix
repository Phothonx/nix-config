{ systemConfig, pkgs, lib, ... }:
{
  programs.nushell = {
    environmentVariables = {
      FLAKE = systemConfig.dotsPath;
      SHELL = lib.getExe pkgs.nushell;

      PROMPT_INDICATOR = "\"\"";
      PROMPT_INDICATOR_VI_INSERT = "\"\"";
      PROMPT_INDICATOR_VI_NORMAL = "\"\"";
      PROMPT_MULTILINE_INDICATOR = "\"\"";
    };
  };
}
