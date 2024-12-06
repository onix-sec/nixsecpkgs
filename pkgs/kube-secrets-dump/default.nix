{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
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

  preBuild = ''
    cat > setup.py << EOF
    from setuptools import setup

    setup(
      name='${pname}',
      scripts=['main.py'],
    )
    EOF
  '';

  postInstall = ''
    mv -v $out/bin/main.py $out/bin/${pname}
  '';

  meta = {
    description = "Dump and decode Kubernetes secrets";
    homepage = "https://github.com/deoktr/kube_secrets_dump";
    license = lib.licenses.mit;
  };
}
