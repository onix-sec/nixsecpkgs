{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "carbon14";
  version = "74305fc";

  src = fetchFromGitHub {
    owner = "Lazza";
    repo = "Carbon14";
    rev = "74305fc734bc6c6190f12d76ad42425dadda39d3";
    hash = "sha256-GHTXgmPAlUD55/1MjRCqO+Ib9fuEUF1lqOXOPyD+5LM=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    colorama
    cssselect
    lxml
    pytz
    requests
    six
    tzlocal
  ];

  preBuild = ''
    cat > setup.py << EOF
    from setuptools import setup

    with open('requirements.txt') as f:
        install_requires = f.read().splitlines()

    setup(
      name='${pname}',
      install_requires=install_requires,
      scripts=['carbon14.py'],
    )
    EOF
  '';

  postInstall = ''
    mv -v $out/bin/carbon14.py $out/bin/carbon14
  '';

  meta = {
    description = "OSINT dating tool for web pages";
    homepage = "https://github.com/Lazza/Carbon14";
    license = lib.licenses.gpl3;
  };
}
