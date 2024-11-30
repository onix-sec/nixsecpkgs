{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "buster";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sham00n";
    repo = "buster";
    rev = "131437e6128b6ad85fa2a9f17ad51311c885b8c2";
    hash = "sha256-C+Pxt2erEiwOstf46jGQuRCkq7Cj/zc+Ho8wI8NTGlA=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    lxml
    beautifulsoup4
    gevent
    grequests
    requests
    cython
    pysocks
    aiodns
    schedule
    geopy
    aiohttp-socks
    fake-useragent
    pandas
    elasticsearch
    aiohttp
    cchardet
    setuptools

    # twint
    (buildPythonApplication rec {
      pname = "twint";
      version = "2.1.20";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-s7dnGZfjHqXf+fTMoPg63QfDFj/Xqx3I5E+REO6xll0=";
      };
    })

    # PyYaml
    (buildPythonApplication rec {
      pname = "PyYAML";
      version = "6.0.2";
      src = fetchFromGitHub {
        owner = "yaml";
        repo = "pyyaml";
        rev = version;
        hash = "sha256-IQoZd9Lp0ZHLAQN3PFwMsZVTsIVJyIaT9D6fpkzA8IA=";
      };
    })

    # googletransx
    (buildPythonApplication rec {
      pname = "googletransx";
      version = "2.4.2";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-xGVn4zZcKrvorxAEEhtjA/Uwv3ICXRwwRe0UhhkC1to=";
      };
    })
  ];

  meta = {
    description = "An advanced tool for email reconnaissance";
    homepage = "https://github.com/sham00n/buster";
    license = lib.licenses.gpl3;
  };
}
