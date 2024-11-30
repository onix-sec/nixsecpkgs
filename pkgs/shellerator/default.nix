{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "shellerator";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ShutdownRepo";
    repo = "shellerator";
    rev = "c325e3d9c0556af5924c7b2a105d54536d71164e";
    hash = "sha256-yHyjcRA/lGCjYIBxYsvRbLipBd+7I5jU8gf9NZzpbps=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    colorama
    psutil

    (buildPythonApplication rec {
      pname = "simple-term-menu";
      version = "1.6.5";
      src = fetchFromGitHub {
        owner = "IngoMeyer441";
        repo = "simple-term-menu";
        rev = "v${version}";
        hash = "sha256-UYOHQTfN+jYMD08J1sL8sbF2JeIpboGoDZNazH45DTo=";
      };
    })

    (buildPythonApplication rec {
      pname = "argparse";
      version = "1.4.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-YrCJpVvh2JSc0rx+DfC9254Cj678jDIDjMhIYq791uQ=";
      };
    })

    (buildPythonApplication rec {
      pname = "console-menu";
      version = "0.8.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-88c35VJC9xsvpqrK8SrtZLmL1r0ZwMDtjPspTEcsLlw=";
      };
    })
  ];

  meta = {
    description = "Simple CLI tool for the generation of bind and reverse shells in multiple languages";
    homepage = "https://github.com/ShutdownRepo/shellerator";
    license = lib.licenses.mit;
  };
}
