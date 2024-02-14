{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = pkgs.stdenv.mkDerivation { # neovim nvchad config
      pname = "nvchad";
      version = "2.0";
      dontBuild = true;

    src = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "282a23f4469ee305e05ec7a108a728ee389d87fb";
      hash = "sha256-gS2wtcY6KR045F1TA1ZuDRSK2hs8tbmUUQriPtgWQiw=";
    };
    installPhase = ''
      mkdir $out
      cp -aR $src/* $out/
      chmod -R +w $out
      cd $out/
      cp -aR ${./custom} $out/lua/custom
    '';
  };
}