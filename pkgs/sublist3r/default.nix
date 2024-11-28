{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "sublist3r";
  version = "1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aboul3la";
    repo = "Sublist3r";
    rev = "729d649ec5370730172bf6f5314aafd68c874124";
    hash = "sha256-nrnb3jAIHw6WXR7VLNmi1YdfMBzHEIiMlGSbrvEi6Uc=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    dnspython
    requests
  ];

  meta = {
    description = "Fast subdomains enumeration tool for penetration testers";
    homepage = "https://github.com/aboul3la/Sublist3r";
    license = lib.licenses.gpl2;
  };
}
