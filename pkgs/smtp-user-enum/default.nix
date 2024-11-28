{
  lib,
  pkgs,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "smtp-user-enum";
  version = "758d602";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cytopia";
    repo = "smtp-user-enum";
    rev = "758d60268733b00d9b18d510ede3dabd1fab3294";
    hash = "sha256-2GI//nv87H2zDkkgjAHSx2Zm2Sk0EpxmXQAN+I1K65I=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = [
    (pkgs.callPackage ./argparse.nix { })
  ];

  meta = {
    description = "SMTP user enumeration via VRFY, EXPN and RCPT with clever timeout, retry and reconnect functionality";
    homepage = "https://github.com/cytopia/smtp-user-enum";
    license = lib.licenses.mit;
  };
}