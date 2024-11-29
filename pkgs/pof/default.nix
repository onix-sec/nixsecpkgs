{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "pof";
  version = "1.4.2";

  src = fetchFromGitHub {
    owner = "deoktr";
    repo = "pof";
    rev = version;
    hash = "sha256-q59jiP0/A8VrxpHGc/84FEnjF2lM2fHQ/6wAqRK8imU=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    pillow
    rope
  ];

  meta = {
    changelog = "https://github.com/deoktr/pof/releases/tag/${version}";
    description = "Python Obfuscation Framework";
    homepage = "https://github.com/deoktr/pof";
    license = lib.licenses.gpl3;
  };
}
