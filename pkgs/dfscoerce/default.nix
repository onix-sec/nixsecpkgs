{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "dfscoerce";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Wh04m1001";
    repo = "DFSCoerce";
    rev = "e6f50871f17a881039afad9836a136db17d30d2b";
    hash = "sha256-QJIGZQCd+HTDJAx7FkPWxN/s2lZNe05eZzeUEC/NpRY=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [ impacket ];

  preBuild = ''
    cat > setup.py << EOF
    from setuptools import setup

    setup(
      name='${pname}',
      scripts=['dfscoerce.py'],
      entry_points={'console_scripts': ['dfscoerce=dfscoerce:main']},
    )
    EOF
  '';

  postInstall = ''
    mv -v $out/bin/dfscoerce.py $out/bin/dfscoerce
  '';

  meta = {
    description = "PoC for MS-DFSNM coerce authentication using NetrDfsRemoveStdRoot and NetrDfsAddStdRoot";
    homepage = "https://github.com/Wh04m1001/DFSCoerce";
    # No license
  };
}
