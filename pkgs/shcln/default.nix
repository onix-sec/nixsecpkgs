{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "shcln";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "deoktr";
    repo = "shcln";
    rev = "v${version}";
    hash = "sha256-koLopo4K4dDxV1R59C3BKJBBvRmhZTWvpwaxfUIWCmw=";
  };

  cargoHash = "sha256-SS/qr0PLRQVbB9S9CfWXCQ6+NT8VGt158hSTwQsoFlM=";

  meta = {
    description = "Remove sensitive entries from shell histories";
    homepage = "https://github.com/deoktr/shcln";
    license = lib.licenses.asl20;
  };
}
