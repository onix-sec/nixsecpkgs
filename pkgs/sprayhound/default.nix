{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "sprayhound";
  version = "0.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Hackndo";
    repo = "sprayhound";
    rev = "5e0e5b757ab1ab8f832eddea2fad883f2773bc6e";
    hash = "sha256-px0WilnKxLpMYRCN/lnV1J/MFWVb0Z/il3WHMlTsoiI=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    setuptools
    neo4j
    python-ldap
  ];

  meta = {
    description = "Password spraying tool and Bloodhound integration";
    homepage = "https://github.com/Hackndo/sprayhound";
    license = lib.licenses.mit;
  };
}
