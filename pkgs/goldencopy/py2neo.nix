{
  lib,
  pkgs,
  python3Packages,
  fetchPypi,
}:

python3Packages.buildPythonApplication rec {
  pname = "py2neo";
  version = "2021.2.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Syc3/Nn9jYK1foVt5O2gBSgcnPB0HJieUlJnjwUD934=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies =
    (with python3Packages; [
      certifi
      monotonic
      packaging
      pygments
      six
      urllib3
    ])
    ++ [
      # interchange
      (pkgs.callPackage ./interchange.nix { })

      # pansi
      (pkgs.callPackage ./pansi.nix { })
    ];

  meta = {
    homepage = "https://github.com/neo4j-contrib/py2neo";
    license = lib.licenses.asl20;
  };
}
