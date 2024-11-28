{
  lib,
  pkgs,
  python3Packages,
  fetchPypi,
}:

python3Packages.buildPythonApplication rec {
  pname = "goldencopy";
  version = "1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MxEyVqTlFLUumOjiUOnLYU20Kv2yhb07G6kwfYJWlps=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = [
    # py2neo
    (pkgs.callPackage ./py2neo.nix { })
  ];

  meta = {
    changelog = "https://github.com/Dramelac/GoldenCopy/releases/tag/v${version}";
    description = "Copy the properties and groups of a user from neo4j (bloodhound) to create an identical golden ticket";
    homepage = "https://github.com/Dramelac/GoldenCopy";
    license = lib.licenses.gpl3;
  };
}
