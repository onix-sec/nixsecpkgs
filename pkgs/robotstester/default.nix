{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "robotstester";
  version = "037f8c3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "p0dalirius";
    repo = "robotstester";
    rev = "037f8c3e3640e43dc205ab793f8524dc33906022";
    hash = "sha256-ZNepvkEWirKhwK/fJj8/jdd6JU71mnnPK1Hx3U7h9T4=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    requests
    urllib3
    rich
  ];

  meta = {
    description = "This Python script can enumerate all URLs present in robots.txt files, and test whether they can be accessed or not";
    homepage = "https://github.com/p0dalirius/robotstester";
    license = lib.licenses.gpl3;
  };
}
