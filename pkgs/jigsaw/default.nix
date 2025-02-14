{ python3Packages }:

python3Packages.buildPythonApplication {
  pname = "jigsaw";
  version = "6c59fd9";

  format = "other";
  dontUnpack = true;
  installPhase = "install -Dm755 ${./src/jigsaw.py} $out/bin/jigsaw";

  meta = {
    description = "Hide shellcode by shuffling bytes into a random array and reconstruct at runtime";
    homepage = "https://github.com/RedSiege/Jigsaw";
    # No license
  };
}
