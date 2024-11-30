{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "jackit";
  version = "1.0.0";

  # Fix PEP 517 error
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "insecurityofthings";
    repo = "jackit";
    rev = "ee0bee854d544e0ee97d559604b4a673866db01e";
    hash = "sha256-25EaUUasUavQeQf1oCHfaMbWIgW3x3XzK0kyJ9CbcRs=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    (buildPythonApplication rec {
      pname = "click";
      version = "5.1";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-Z4yYJ1Qx+tMkJ13sY3keShdVi0DloRDiCoKGYTmoWlo=";
      };
    })

    (buildPythonApplication {
      pname = "pyusb";
      version = "1.0.0";
      src = fetchFromGitHub {
        owner = "pyusb";
        repo = "pyusb";
        rev = "d7e6291564a5d5683a8b03fc9a761ad3e3dd70ea";
        hash = "sha256-94SwmtL5NmCwt8JQ3Tix+2fKRhnLL0PsSK3mafyKSFo=";
      };
    })

    (buildPythonApplication rec {
      pname = "tabulate";
      version = "0.7.5";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-kHGqy9l6mpFQlsGq8NxoSsJnKQTNh221kECF1trJgQ4=";
      };
      build-system = with python3Packages; [
        setuptools
        setuptools_scm
      ];
    })

    (buildPythonApplication rec {
      pname = "six";
      version = "1.10.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-EF+NaGFvgkjiS/DpNy7wTTzBAQTxmA9U1Xss5zpa1Wo=";
      };
    })
  ];

  meta = {
    description = "JackIt - Exploit Code for Mousejack";
    homepage = "https://github.com/insecurityofthings/jackit";

    # No copy of the license
    license = lib.licenses.bsd0;
  };
}
