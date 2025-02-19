{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "carbon14";
  version = "74305fc";

  src = fetchFromGitHub {
    owner = "Lazza";
    repo = "Carbon14";
    rev = "74305fc734bc6c6190f12d76ad42425dadda39d3";
    hash = "sha256-GHTXgmPAlUD55/1MjRCqO+Ib9fuEUF1lqOXOPyD+5LM=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    colorama
    cssselect
    lxml
    pytz
    requests
    six
    tzlocal
  ];

  format = "other";
  dontUnpack = true;
  installPhase = ''
    install -Dm755 $src/carbon14.py $out/bin/carbon14
  '';

  meta = {
    description = "OSINT dating tool for web pages";
    homepage = "https://github.com/Lazza/Carbon14";
    license = lib.licenses.gpl3;
  };
}
