{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "pywhisker";
  version = "b0d8e46";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ShutdownRepo";
    repo = "pywhisker";
    rev = "b0d8e462e2bd154025d52886661f12c00c570362";
    hash = "sha256-O+DT4yidoW4tZvOhrGYqfWInYimAtyxrSAxyYmN7WVo=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    impacket
    cryptography
    six
    pyasn1
    ldap3
    ldapdomaindump
    rich
    setuptools
    dsinternals
  ];

  meta = {
    description = "Python version of the C# tool for 'Shadow Credentials' attacks";
    homepage = "https://github.com/ShutdownRepo/pywhisker";
    license = lib.licenses.gpl3;
  };
}
