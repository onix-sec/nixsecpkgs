{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "shuffledns";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "projectdiscovery";
    repo = "shuffledns";
    rev = "v${version}";
    hash = "sha256-wfHGIWdksfe0sNss4pLQ0ODh28u2kMuxAJh5C9Uiap4=";
  };

  vendorHash = "sha256-A4Ssvc6UOvwezzdMa+nPkwyVT8j15+mTAAL+loeBcCo=";

  meta = {
    description = "MassDNS wrapper written in go to enumerate valid subdomains using active bruteforce as well as resolve subdomains with wildcard filtering and easy input-output support";
    homepage = "https://github.com/projectdiscovery/shuffledns";
    license = lib.licenses.gpl3;
  };
}
