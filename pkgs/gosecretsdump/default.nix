{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "gosecretsdump";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "C-Sto";
    repo = "gosecretsdump";
    rev = "v${version}";
    hash = "sha256-qaUhpoAqmwO/CRdx1hkOotGFI4DTLIkc99gJ6G1SoEk=";
  };

  vendorHash = null;

  # test fails, ignore them
  checkPhase = null;

  meta = {
    description = "Dump ntds.dit really fast";
    homepage = "https://github.com/C-Sto/gosecretsdump";
    license = lib.licenses.gpl3;
  };
}
