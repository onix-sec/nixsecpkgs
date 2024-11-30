{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "uberfile";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ShutdownRepo";
    repo = "uberfile";
    rev = "4414c2a5fdbbab9a604b92e76eab54fe15a70dd3";
    hash = "sha256-SId0Pn32T1vWysAsUDqzVG3x17y1vmFEMsNATG1xpAw=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    psutil
    colorama

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
    description = "Simple CLI tool for the generation of downloader oneliners for UNIX-like or Windows systems";
    homepage = "https://github.com/ShutdownRepo/uberfile";
    license = lib.licenses.gpl3;
  };
}
