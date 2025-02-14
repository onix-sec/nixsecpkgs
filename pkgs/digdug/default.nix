{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "digdug";
  version = "bf73e4b";

  src = fetchFromGitHub {
    owner = "RedSiege";
    repo = "DigDug";
    rev = "bf73e4bf101d4a9eb6247ed236e5bfd947c3d1a4";
    hash = "sha256-6UajVxLmtOxc1G/1ot/Wav9efvvYtc9pvQCijtwFBjE=";
  };

  format = "other";
  dontUnpack = true;
  installPhase = ''
    install -Dm755 $src/digdug.py $out/bin/digdug

    # add dictionaries
    mkdir -p $out/share/digdug
    cp -r $src/dictionaries/* $out/share/digdug
  '';

  meta = {
    description = "Evade some AV/EDR detections by increasing a given executable file size";
    homepage = "https://github.com/RedSiege/DigDug";
    license = lib.licenses.bsd3;
  };
}
