{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "git-dumper";
  version = "1.0.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arthaud";
    repo = "git-dumper";
    rev = version;
    hash = "sha256-XU+6Od+mC8AV+w7sd8JaMB2Lc81ekeDLDiGGNu6bU0A=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    pysocks
    requests
    beautifulsoup4
    dulwich
    requests-pkcs12
  ];

  meta = {
    description = "A tool to dump a git repository from a website";
    homepage = "https://github.com/arthaud/git-dumper";
    license = lib.licenses.mit;
  };
}
