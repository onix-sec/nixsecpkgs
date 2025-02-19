{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "gpp-decrypt";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "t0thkr1s";
    repo = "gpp-decrypt";
    rev = "c71c7a6c3c8d251bf1b66050a00b9bb53362d326";
    hash = "sha256-ylJnpAV3ZnhfaA0HdcH/6CqdgkB/EEh2P5wvHTzVZPw=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    pycrypto
    colorama
  ];

  format = "other";
  dontUnpack = true;
  installPhase = ''
    install -Dm755 $src/gpp-decrypt.py $out/bin/gpp-decrypt
  '';

  meta = {
    description = "Tool to parse the Group Policy Preferences XML file which extracts the username and decrypts the cpassword attribute";
    homepage = "https://github.com/t0thkr1s/gpp-decrypt";
    license = lib.licenses.gpl3;
  };
}
