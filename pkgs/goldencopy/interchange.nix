{
  lib,
  python3Packages,
  fetchPypi,
}:

python3Packages.buildPythonApplication rec {
  pname = "interchange";
  version = "2021.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Z5HRs0Yh6ZADX+ddgIUjFyNA2AreG1BBIiaCAYQZlVA=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    pytz
    six
  ];

  meta = {
    homepage = "https://github.com/neo4j-contrib/interchange";
    license = lib.licenses.asl20;
  };
}
