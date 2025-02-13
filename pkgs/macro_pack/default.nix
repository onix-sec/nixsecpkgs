{
  lib,
  pkgs,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "macro_pack";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sevagas";
    repo = "macro_pack";
    rev = "v${version}";
    hash = "sha256-a4zzYl74+Ryvzo4GuI7KLq/L84Z2F9kTxwjAjgGDBaw=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    colorama
    termcolor
    tabulate
    psutil
    wsgidav
    cheroot

    (buildPythonApplication rec {
      pname = "future";
      version = "0.18.2";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-sb6tkLcM9uw/BxCuU6UlNg+jYNMGqGWDrca/g6TbU30=";
      };
    })

    (buildPythonApplication rec {
      pname = "clr";
      version = "1.0.3";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-JlBbUfc1GNUxpSsfeFVIj4x2TelPJI67fL4FSazJ0zM=";
      };
    })

    (buildPythonApplication rec {
      pname = "pycdlib";
      version = "1.9.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-3k42gD8rAAbN80HJveF4MvGUFu3u5q9C9j29khMzOv4=";
      };
    })

    (buildPythonApplication rec {
      pname = "pyinstaller";
      version = "6.11.1";
      # Fix PEP 517 error
      format = "pyproject";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-SR37TZ1dHZZQ2VB9rsH/aClSeiVNjjlrrdYKCv/Lcu8=";
      };
      dependencies = [
        pkgs.zlib
        python3Packages.setuptools
        python3Packages.altgraph
        python3Packages.pyinstaller-hooks-contrib
      ];
    })

    (buildPythonApplication rec {
      pname = "boxsdk";
      version = "2.10.0";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-SuPfeNgeKoknkkShvoHP/0oDHisWiHpSLVSxSXiLD8E=";
      };
      # tests fail
      doCheck = false;
    })
  ];

  patches = [ ./main_cli.patch ];

  preBuild = ''
    cat > pyproject.toml << EOF
    [project]
    name = "macro_pack"
    version = "2.2.0"
    readme = "README.md"
    license = {file = "LICENSE"}
    requires-python = ">= 3.8"
    dependencies = [
      "colorama>=0.4.0",
      "termcolor>=1.1.0",
      "tabulate>=0.8.5",
      "psutil>=5.6.7",
      "clr>=1.0.3",
      "wsgidav>=3.0.0",
      "cheroot>=6.3.3",
      "pycdlib>=1.9.0",
      "PyInstaller>=4.0",
      "future~=0.18.2",
      "boxsdk~=2.10.0"
    ]

    [project.scripts]
    macro_pack = "macro_pack:main_cli"
    EOF
  '';

  meta = {
    changelog = "https://github.com/sevagas/macro_pack/releases/tag/v${version}";
    description = "Tool used to automatize obfuscation and generation of Office documents, VB scripts, shortcuts, and other formats for pentest, demo, and social engineering assessments";
    homepage = "https://github.com/sevagas/macro_pack";
    license = lib.licenses.apsl20;
  };
}
