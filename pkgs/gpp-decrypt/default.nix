{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "gpp-decrypt";
  version = "1.0";

  # Fix PEP 517 error
  format = "pyproject";

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

  preBuild = ''
    cat > setup.py << EOF
    from setuptools import find_packages, setup

    setup(
        name='gpp-decrypt',
        version='1.0',
        author='Kristof Toth',
        author_email='t0thkr1s@icloud.com',
        description='Tool to parse the Group Policy Preferences XML file which '
                    'extracts the username and decrypts the cpassword attribute.',
        install_requires=['pycrypto', 'colorama'],
        scripts=['gpp-decrypt.py'],
    )
    EOF
  '';

  postInstall = ''
    mv -v $out/bin/gpp-decrypt.py $out/bin/gpp-decrypt
  '';

  meta = {
    description = "Tool to parse the Group Policy Preferences XML file which extracts the username and decrypts the cpassword attribute";
    homepage = "https://github.com/t0thkr1s/gpp-decrypt";
    license = lib.licenses.gpl3;
  };
}
