{ python3Packages }:

python3Packages.buildPythonApplication {
  pname = "jargon";
  version = "9efec00";

  format = "other";
  dontUnpack = true;
  installPhase = "install -Dm755 ${./src/jargon.py} $out/bin/jargon";

  meta = {
    description = "Program to translate shellcode bytes into words for entropy analysis evasion";
    homepage = "https://github.com/RedSiege/jargon";
    # No license
  };
}
