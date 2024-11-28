{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "smartbrute";
  version = "47fd659";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ShutdownRepo";
    repo = "smartbrute";
    rev = "47fd659304982c1c9d06afb61b9367ce57084ca3";
    hash = "sha256-9JpU7b4xH4yHUcyayk0GZsRy7Lh3qkt/HmS94F/+qAs=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    neo4j
    ldap3
    pyasn1
    impacket
    rich
  ];

  meta = {
    description = "Password spraying and bruteforcing tool for Active Directory Domain Services";
    homepage = "https://github.com/ShutdownRepo/smartbrute";
    license = lib.licenses.gpl3;
  };
}
