{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "go-bhtool";
  version = "0.0.3";

  src = fetchFromGitHub {
    owner = "patrickhener";
    repo = "go-bhtool";
    rev = "f6d96c68adc0cd8aee6cc0f96d79e28269b5a71d";
    hash = "sha256-FMD9fRidF2GF3MHVjNeDZGj572/Nnl7VhOj6Ri0nGkc=";
  };

  vendorHash = "sha256-XA0tmzkj9t52pOKc62o/WnQ0Pb1dhnXULzUrceeHPU4=";

  meta = {
    description = "Helper tool for BloodHound that easily allows to mark a bunch of users as owned";
    homepage = "https://github.com/patrickhener/go-bhtool";
    # No license
  };
}
