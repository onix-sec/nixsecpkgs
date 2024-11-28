{ lib, bundlerApp }:

bundlerApp {
  pname = "haiti-hash";
  gemdir = ./.;
  exes = [ "haiti" ];

  meta = {
    description = "Hash type identifier";
    homepage = "https://github.com/noraj/haiti";
    license = lib.licenses.mit;
  };
}
