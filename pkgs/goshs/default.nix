{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "goshs";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "patrickhener";
    repo = "goshs";
    rev = "v${version}";
    hash = "sha256-J74nUH3iBYDytXCswIexvShG5+zJEDX19saJ3ftLYhI=";
  };

  vendorHash = "sha256-6UaKh2UUyGqOriAaMhiEFr20R4W/ZWxQXtXnm/BVHOc=";

  meta = {
    description = "A SimpleHTTPServer written in Go, enhanced with features and with a nice design";
    homepage = "https://github.com/patrickhener/goshs";
    license = lib.licenses.mit;
  };
}
