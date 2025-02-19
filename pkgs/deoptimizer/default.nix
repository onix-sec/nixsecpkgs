{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

with lib;

rustPlatform.buildRustPackage rec {
  pname = "deoptimizer";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "EgeBalci";
    repo = "deoptimizer";
    rev = "v${version}";
    hash = "sha256-0nn9DCglTarg4OngxSCHb3eF2J/esu5z0IjkYquDOac=";
  };

  cargoHash = "sha256-S9m/8LFGfZI6cPkBdawlQhenLkOsienm6y4Uo/yC45g=";

  meta = {
    description = "Evasion by machine code de-optimization";
    homepage = "https://github.com/EgeBalci/deoptimizer";
    license = licenses.mit;
  };
}
