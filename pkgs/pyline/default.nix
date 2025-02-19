{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "pyline";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "deoktr";
    repo = "pyline";
    rev = "9b22c56eb75cff799ea139f1be6fd470d28cf9b0";
    hash = "sha256-2rAiW5S+Z/K+tBj+le0HlwfRO91goY22BgUbw7w5IvY=";
  };

  format = "other";
  dontUnpack = true;
  installPhase = ''
    install -Dm755 $src/pyline.py $out/bin/pyline
  '';

  meta = {
    description = " Python one liner generator";
    homepage = "https://github.com/deoktr/pyline";
    license = lib.licenses.mit;
  };
}
