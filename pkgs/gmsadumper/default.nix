{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "gmsadumper";
  version = "e03187c";

  src = fetchFromGitHub {
    owner = "micahvandeusen";
    repo = "gMSADumper";
    rev = "e03187ca5c2b38b8742a20b919ebe38633c0b084";
    hash = "sha256-IR/nZr8tWmIqN5ghN6rBc3YmLMinyN5T6IvtStzivDE=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    # impacket
    (buildPythonApplication rec {
      pname = "impacket";
      version = "0.10.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-uOsCCiy7RxRmac/jHGS7Ln1kmdBJxJPWQYuXFvXHRYM=";
      };
    })

    ldap3

    # pycryptodomex
    (buildPythonApplication rec {
      pname = "pycryptodomex";
      version = "3.15.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-c0Hxuy2tsNGgBH80w6WCCKkkI829MkTZmOSyjfXqwO0=";
      };
    })

    # pycryptodome
    (buildPythonApplication rec {
      pname = "pycryptodome";
      version = "3.19.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-vDXUYyIs202+vTXgeEFVyB4WG5KE5Wfn6TPXIuUzMx4=";
      };
    })

    six
  ];

  format = "other";
  dontUnpack = true;
  installPhase = ''
    install -Dm755 $src/gMSADumper.py $out/bin/gmsadumper
  '';

  meta = {
    description = "Lists who can read any gMSA password blobs and parses them if the current user has access";
    homepage = "https://github.com/micahvandeusen/gMSADumper";
    license = lib.licenses.gpl3;
  };
}
