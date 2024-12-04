{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "crackhound";
  version = "3029bc2";

  src = fetchFromGitHub {
    owner = "trustedsec";
    repo = "crackhound";
    rev = "3029bc2b44ec767ea143663b3b8240402697aa00";
    hash = "sha256-oQh68HaB+JrPb1Rrz5H2nlqnSH466OYwu/ULoVg8B0w=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [ neo4j ];

  preBuild = ''
    cat > setup.py << EOF
    from setuptools import setup

    with open('requirements.txt') as f:
        install_requires = f.read().splitlines()

    setup(
      name='${pname}',
      install_requires=install_requires,
      scripts=['crackhound.py'],
      entry_points={'console_scripts': ['crackhound=crackhound:main']},
    )
    EOF
  '';

  postInstall = ''
    mv -v $out/bin/crackhound.py $out/bin/crackhound
  '';

  meta = {
    description = "CrackHound is a way to introduce plain-text passwords into BloodHound";
    homepage = "https://github.com/trustedsec/CrackHound";
    license = lib.licenses.gpl2;
  };
}
