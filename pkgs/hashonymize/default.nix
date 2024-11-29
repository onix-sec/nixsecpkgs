{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "hashonymize";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "ShutdownRepo";
    repo = "hashonymize";
    rev = "30e3c9f874d17f86d89e1f63aa75381e176c28da";
    hash = "sha256-c12JD/SndR8chPnYrpCysw/4UOjGuYBDOPzRl7+5Pi0=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  meta = {
    description = "Anonymize your hashcat formatted files for online cracking";
    homepage = "https://github.com/ShutdownRepo/hashonymize";
    license = lib.licenses.gpl3;
  };
}
