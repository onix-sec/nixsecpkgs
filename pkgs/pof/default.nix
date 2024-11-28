{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "pof";
  version = "1.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "deoktr";
    repo = "pof";
    rev = version;
    hash = "sha256-E/9FJf9ospSuhAZskhxtrs+0SpvFuEZy1cI34+DXYDM=";
  };

  # FIXME: doesn't work for some reason
  # src = fetchPypi {
  #   inherit version;
  #   pname = "python-obfuscation-framework";
  #   hash = "sha256-E/9FJf9ospSuhAZskhxtrs+0SpvFuEZy1cI34+DXYDM=";
  # };

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
