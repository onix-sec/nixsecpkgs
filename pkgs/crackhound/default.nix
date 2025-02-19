{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "crackhound";
  version = "3029bc2";

  src = fetchFromGitHub {
    owner = "trustedsec";
    repo = "crackhound";
    rev = "3029bc2b44ec767ea143663b3b8240402697aa00";
    hash = "sha256-oQh68HaB+JrPb1Rrz5H2nlqnSH466OYwu/ULoVg8B0w=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [ neo4j ];

  format = "other";
  dontUnpack = true;
  installPhase = ''
    install -Dm755 $src/crackhound.py $out/bin/crackhound
  '';

  meta = {
    description = "CrackHound is a way to introduce plain-text passwords into BloodHound";
    homepage = "https://github.com/trustedsec/CrackHound";
    license = lib.licenses.gpl2;
  };
}
