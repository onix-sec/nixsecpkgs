{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "finduncommonshares";
  version = "3.2";

  src = fetchFromGitHub {
    owner = "p0dalirius";
    repo = "pyFindUncommonShares";
    rev = "43f70baf16eeb3f9253e16ef34072947b2cbe162";
    hash = "sha256-QgiMd2dg1VzFXnClOhhAHQN4NFZ9s3Dc+z6X1H/8ZL8=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    impacket
    xlsxwriter
    sectools
    pycryptodome
    dnspython
  ];

  preBuild = ''
    cat > setup.py << EOF
    from setuptools import setup

    with open('requirements.txt') as f:
        install_requires = f.read().splitlines()

    setup(
      name='${pname}',
      install_requires=install_requires,
      scripts=['FindUncommonShares.py'],
    )
    EOF
  '';

  postInstall = ''
    mv -v $out/bin/FindUncommonShares.py $out/bin/finduncommonshares
  '';

  meta = {
    description = "FindUncommonShares is a Python script allowing to quickly find uncommon shares in vast Windows Domains, and filter by READ or WRITE accesses";
    homepage = "https://github.com/p0dalirius/pyFindUncommonShares";
    # No license
  };
}
