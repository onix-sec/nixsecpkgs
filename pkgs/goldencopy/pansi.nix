{
  lib,
  python3Packages,
  fetchPypi,
}:

python3Packages.buildPythonApplication rec {
  pname = "pansi";
  version = "2024.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AYGGKU8BKuSOIH2URrG9IrDy67LeYKbE+weav6zfSjc=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [ pillow ];

  meta = {
    homepage = "https://github.com/technige/pansi";
    license = lib.licenses.asl20;
  };
}
