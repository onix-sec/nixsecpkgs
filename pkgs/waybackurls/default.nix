{
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "waybackurls";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "tomnomnom";
    repo = "waybackurls";
    rev = "v${version}";
    hash = "sha256-aX6pCEp2809oYn1BUwdfKzJzMttnZItGXC1QL4yMztg=";
  };

  vendorHash = null;

  meta = {
    description = "";
    homepage = "https://github.com/tomnomnom/waybackurls";
    # No license...
  };
}
