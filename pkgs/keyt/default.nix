{
  lib,
  python3Packages,
  fetchPypi,
}:

python3Packages.buildPythonApplication rec {
  pname = "keyt";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MROxAe/j0CeA5EHMyC3xId00vFzcxttlc8kdYW5y5ZM=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    pyperclip
    base58
  ];

  meta = {
    changelog = "https://github.com/deoktr/keyt/releases/tag/v${version}";
    description = "Stateless password manager and generator";
    homepage = "https://github.com/deoktr/keyt";
    license = lib.licenses.mit;
  };
}
