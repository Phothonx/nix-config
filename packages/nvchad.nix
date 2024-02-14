{ pkgs, ... }:
{
  nvchad = pkgs.stdenv.mkDerivation rec {
    pname = "nvchad";
    version = "2.0";
    dontBuild = true;

    src = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "https://github.com/NvChad/NvChad/commit/f17e83010f25784b58dea175c6480b3a8225a3e9";
      sha256 = "";
    };

    installPhase = ''
    mkdir $out
    
    
    '';

  };   
}