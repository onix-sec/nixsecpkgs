{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "toutatis";
  version = "1.31";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "megadose";
    repo = "toutatis";
    rev = "22a59c0984fd17d5e01cdb57669ec527b2c6b3d5";
    hash = "sha256-jBQl8jK6lGB+2bLJHWXyIAhm93LbDdXrbeiYukFi4UU=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    requests
    phonenumbers
    pycountry

    (buildPythonApplication rec {
      pname = "argparse";
      version = "1.4.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-YrCJpVvh2JSc0rx+DfC9254Cj678jDIDjMhIYq791uQ=";
      };
    })
  ];

  meta = {
    description = "Toutatis is a tool that allows you to extract information from instagrams accounts such as e-mails, phone numbers and more";
    homepage = "https://github.com/megadose/toutatis";
    license = lib.licenses.gpl3;
  };
}
