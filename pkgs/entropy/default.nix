{ lib, python3Packages }:

python3Packages.buildPythonApplication {
  pname = "entropy";
  version = "1.0.1";

  format = "other";
  dontUnpack = true;
  installPhase = "install -Dm755 ${./src/entropy.py} $out/bin/entropy";

  meta = {
    description = "Calculate the Shannon entropy of a file";
    license = lib.licenses.mit;
  };
}
