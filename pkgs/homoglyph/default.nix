{
  lib,
  pkgs,
  python3Packages,
}:

python3Packages.buildPythonApplication {
  pname = "homoglyph";
  version = "1.0.0";

  format = "other";
  dontUnpack = true;
  installPhase = "install -Dm755 ${./src/homoglyph.py} $out/bin/homoglyph";

  dependencies = [ (pkgs.callPackage ./../pof { }) ];

  meta = {
    description = "Generate homoglyph";
    license = lib.licenses.mit;
  };
}
