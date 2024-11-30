{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "whatportis";
  version = "0.8.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ncrocfer";
    repo = "whatportis";
    rev = "59a1718bf7c531f2a5a4e213cad0c047ce9c1c94";
    hash = "sha256-tdh0001co7ufkKgPYhKaqsT87GYIKu9MKWzd8mqvvbI=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    # simplejson
    (buildPythonApplication rec {
      pname = "simplejson";
      version = "3.17.2";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-dezHnybZkiKghPvdHOWq06w6i9U1zZBZUoRS2ji2iEE=";
      };
    })

    # tinydb
    (buildPythonApplication rec {
      pname = "tinydb";
      version = "4.4.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-1XwpUk7KzAgevCT5bg14e7oR3CDVJjSjKnCbh4vjVFo=";
      };
    })

    # requests
    (buildPythonApplication rec {
      pname = "requests";
      version = "2.25.1";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-J5c91KkEpPE7JjoZyGbBO5KjntHJZGVfAl8/jT11uAQ=";
      };
    })

    # prettytable
    (buildPythonApplication rec {
      pname = "prettytable";
      version = "2.1.0";
      pyproject = true;
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-WILtkJKzkbuPbpH1m829dIkk/1Vrt8Y0CJ1VGb6HuqA=";
      };
      build-system = with python3Packages; [
        setuptools
        setuptools_scm
        wheel
      ];
      dependencies = with python3Packages; [
        wcwidth
      ];
    })

    # click
    (buildPythonApplication rec {
      pname = "click";
      version = "8.0.1";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-jATBEZIRmx73jqBJ4KbwRj5MSO8AowFgxwQzdYbzrXo=";
      };
    })

    # not present in requirements but needed
    urllib3
    chardet
    certifi
    idna
  ];

  meta = {
    description = "Explore IANA's list of ports";
    homepage = "https://github.com/ncrocfer/whatportis";
    license = lib.licenses.mit;
  };
}
