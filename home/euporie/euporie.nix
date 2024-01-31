{ pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "euporie";
  version = "0.2.7";

  src = pkgs.fetchgit {
    url = "https://github.com/joouha/euporie/archive/refs/tags/v2.7.0.tar.gz";
    sha256 = "";
  };

  buildInputs = [
    pkgs.pipx
  ];

  installPhase = ''
    pipx install euporie
  '';
}