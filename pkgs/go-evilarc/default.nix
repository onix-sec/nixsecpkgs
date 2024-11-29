{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "go-evilarc";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "patrickhener";
    repo = "go-evilarc";
    rev = "3ac8f01382c1ebc96871ed23eeab68ee54199d00";
    hash = "sha256-XLOfIJPoef1ugyu7M5BiHXR2v+JLZOvQDST/RYt+cqA=";
  };

  vendorHash = null;

  preBuild = ''
    cat > go.mod << EOF
    module go-evilarc
    go 1.20
    EOF
  '';

  meta = {
    description = "Create tar/zip archives that can exploit directory traversal vulnerabilities";
    homepage = "https://github.com/patrickhener/go-evilarc";
    # No license
  };
}
