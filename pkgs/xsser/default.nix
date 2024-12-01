{
  lib,
  fetchFromGitHub,
  wrapGAppsHook3,
  gobject-introspection,
  gtk3,
  pango,
  python3Packages,
}:

# Used to be maintained in nixpkgs, stoped in 24.11
# https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/tools/security/xsser/default.nix
python3Packages.buildPythonApplication rec {
  pname = "xsser";
  version = "1.8.4";

  src = fetchFromGitHub {
    owner = "epsylon";
    repo = pname;
    rev = "478242e6d8e1ca921e0ba8fa59b50106fa2f7312";
    sha256 = "MsQu/r1C6uXawpuVTuBGhWNqCSZ9S2DIx15Lpo7L4RI=";
  };

  postPatch = ''
    # Replace relative path with absolute store path
    find . -type f -exec sed -i "s|core/fuzzing/user-agents.txt|$out/share/xsser/fuzzing/user-agents.txt|g" {} +

    # Replace absolute path references with store paths
    substituteInPlace core/main.py --replace /usr $out
    substituteInPlace gtk/xsser.desktop --replace /usr $out
    substituteInPlace setup.py --replace /usr/share share
  '';

  nativeBuildInputs = [
    wrapGAppsHook3
    gobject-introspection
  ];

  buildInputs = [
    gtk3
    pango
  ];

  propagatedBuildInputs = with python3Packages; [
    pillow
    pycurl
    beautifulsoup4
    pygobject3
    cairocffi
    selenium

    # pygeoip
    (buildPythonApplication rec {
      pname = "pygeoip";
      version = "0.3.2";
      src = fetchPypi {
        inherit pname version;
        hash = "sha256-8ixOAN3xIT4PrjbcYLRu58JaYzmUHsGpdVOQFMH5qW0=";
      };
    })
  ];

  # Project has no tests
  doCheck = false;

  dontWrapGApps = true;
  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';

  postInstall = ''
    install -D core/fuzzing/user-agents.txt $out/share/xsser/fuzzing/user-agents.txt
  '';

  meta = with lib; {
    description = "Automatic framework to detect, exploit and report XSS vulnerabilities in web-based applications";
    mainProgram = "xsser";
    homepage = "https://github.com/epsylon/xsser";
    license = licenses.gpl3Only;
  };
}
