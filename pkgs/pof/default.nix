{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "pof";
  version = "1.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "deoktr";
    repo = "pof";
    rev = version;
    hash = "sha256-Fxexic9obY7WToeEVYMhNQC+MydtBe+iT3ILt7IIjrA=";
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
