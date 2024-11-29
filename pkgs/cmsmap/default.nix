{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "cmsmap";
  version = "1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dionach";
    repo = "CMSmap";
    rev = "59dd0e2b3b0c751c6da2b0565374ab83c736b0e6";
    hash = "sha256-PCGkllGKh2DwEesbp0rqz+f4FJqJP8NG3hdJG2nxWPQ=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  meta = {
    description = "CMSmap is a python open source CMS scanner that automates the process of detecting security flaws of the most popular CMSs";
    homepage = "https://github.com/dionach/CMSmap";
    license = lib.licenses.gpl3;
  };
}
