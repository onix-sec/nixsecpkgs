{ python3Packages }:

python3Packages.buildPythonApplication {
  pname = "delta";
  version = "9efec00";

  format = "other";
  dontUnpack = true;
  installPhase = "install -Dm755 ${./src/delta.py} $out/bin/delta";

  meta = {
    description = "Take a raw shellcode file as input and outputs an array of deltas and a C/C++ stub to reconstitute the shellcode in memory";
    homepage = "https://github.com/RedSiege/Delta-Encoder";
    # No license
  };
}
