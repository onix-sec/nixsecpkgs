{
  python3Packages,
  fetchPypi,
}:

python3Packages.buildPythonApplication rec {
  pname = "argparse";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YrCJpVvh2JSc0rx+DfC9254Cj678jDIDjMhIYq791uQ=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  meta = {
    description = "Python command-line parsing library";
    homepage = "https://github.com/ThomasWaldmann/argparse/";
    # https://github.com/ThomasWaldmann/argparse/blob/master/LICENSE.txt
    # FIXME: Python Software Foundation License
    # license = lib.licenses.;
  };
}
