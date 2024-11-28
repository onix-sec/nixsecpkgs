{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "webclientservicescanner";
  version = "0.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Hackndo";
    repo = "WebclientServiceScanner";
    rev = "f0a73e67a35402d1dc7d342ed8889d129c96a48c";
    hash = "sha256-XxtppcsAd8n/9Bs0IbrtzhU0ng3LTafAyIeWHwipkZw=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    impacket
    netaddr
  ];

  meta = {
    description = "Python tool to Check running WebClient services on multiple targets based on @leechristensen";
    homepage = "https://github.com/Hackndo/WebclientServiceScanner";
    license = lib.licenses.mit;
  };
}
