{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "gitlab-dump";
  version = "5971892";

  src = fetchFromGitHub {
    owner = "deoktr";
    repo = "gitlab_dump";
    rev = "59718921c72b692cd29b7c842c84ac8d28b02931";
    hash = "sha256-iEB024xo156wsugzeLqw2oppj567+pL16IoHlqfPnY4=";
  };

  dependencies = with python3Packages; [
    python-gitlab
  ];

  format = "other";
  dontUnpack = true;
  installPhase = ''
    install -Dm755 $src/main.py $out/bin/gitlab-dump
  '';

  meta = {
    description = "Clone every accessible Gitlab repository";
    homepage = "https://github.com/deoktr/gitlab_dump";
    license = lib.licenses.mit;
  };
}
