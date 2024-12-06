{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "gitlab-dump";
  version = "5971892";

  src = fetchFromGitHub {
    owner = "deoktr";
    repo = "gitlab_dump";
    rev = "59718921c72b692cd29b7c842c84ac8d28b02931";
    hash = "sha256-iEB024xo156wsugzeLqw2oppj567+pL16IoHlqfPnY4=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  dependencies = with python3Packages; [
    python-gitlab
  ];

  preBuild = ''
    cat > setup.py << EOF
    from setuptools import setup

    with open('requirements.txt') as f:
        install_requires = f.read().splitlines()

    setup(
      name='${pname}',
      install_requires=install_requires,
      scripts=['main.py'],
    )
    EOF
  '';

  postInstall = ''
    mv -v $out/bin/main.py $out/bin/gitlab-dump
  '';

  meta = {
    description = "Clone every accessible Gitlab repository";
    homepage = "https://github.com/deoktr/gitlab_dump";
    license = lib.licenses.mit;
  };
}
