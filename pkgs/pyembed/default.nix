{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "pyembed";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "deoktr";
    repo = "pyembed";
    rev = version;
    hash = "sha256-JMuIA9mh5PrLmaVAqg2ssIDn8P2NX9kEPZSB0Bq5v7I=";
  };

  format = "other";
  dontUnpack = true;
  installPhase = ''
    install -Dm755 $src/pyembed.py $out/bin/pyembed
  '';

  meta = {
    description = "Generate embeded Python script into C source";
    homepage = "https://github.com/deoktr/pyembed";
    license = lib.licenses.mit;
  };
}
