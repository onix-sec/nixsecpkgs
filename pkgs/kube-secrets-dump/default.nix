{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication {
  pname = "kube-secrets-dump";
  version = "745e403";

  src = fetchFromGitHub {
    owner = "deoktr";
    repo = "kube_secrets_dump";
    rev = "745e4039433103fcdceecd76d7f1adeb87dab9e6";
    hash = "sha256-eAajhAISQN5E+xrF/SnwTZmlOu2MOc4QIelgK7agKLM=";
  };

  build-system = with python3Packages; [
    setuptools
    wheel
  ];

  format = "other";
  dontUnpack = true;
  installPhase = ''
    install -Dm755 $src/main.py $out/bin/kube-secrets-dump
  '';

  meta = {
    description = "Dump and decode Kubernetes secrets";
    homepage = "https://github.com/deoktr/kube_secrets_dump";
    license = lib.licenses.mit;
  };
}
