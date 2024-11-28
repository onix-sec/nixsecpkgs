{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "go-windapsearch";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "ropnop";
    repo = "go-windapsearch";
    rev = "v${version}";
    hash = "sha256-zPaHHesMNKWodlHhAlcJHUT+mfJiYRWEo0mQSY5TmSM=";
  };

  vendorHash = "sha256-E0jzaiTLrVgVD8XHqntG1wFG4cVwnC1lv0l3/7Fn/R4=";

  meta = {
    description = "Utility to enumerate users, groups and computers from a Windows domain through LDAP queries";
    homepage = "https://github.com/ropnop/go-windapsearch";
    license = lib.licenses.bsd3;
  };
}
