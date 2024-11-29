{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "byp4xx";
  version = "b337580";

  src = fetchFromGitHub {
    owner = "lobuhi";
    repo = "byp4xx";
    rev = "b337580a3a62f9af604ad29e12161573bf3c36ed";
    hash = "sha256-iNhA8DcsCjv3XYlGDQ5TRaPnuysrO+NruRQ2+2rt55k=";
  };

  vendorHash = null;

  preBuild = ''
    cat > go.mod << EOF
    module byp4xx
    go 1.20
    EOF

    # include the templates directory
    mkdir -p $out/share/byp4xx
    cp -r $src/templates/* $out/share/byp4xx
  '';

  # TODO: fork/patch it and embed the templates into the executable

  meta = {
    description = "40X/HTTP bypasser in Go";
    homepage = "https://github.com/lobuhi/byp4xx";
    # No license
  };
}
