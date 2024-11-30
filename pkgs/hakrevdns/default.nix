{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule {
  pname = "hakrevdns";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "hakluke";
    repo = "hakrevdns";
    rev = "3001d16c8509405ec623fc294f98dce47e2d3e46";
    hash = "sha256-lLGhhKRAWXxlSH/2ULhwbO5ZCZ4t/ZQjyY09aHsQqCw=";
  };

  vendorHash = "sha256-W6XVd68MS0ungMgam8jefYMVhyiN6/DB+bliFzs2rdk=";

  preBuild = ''
    cat > go.mod << EOF
    module github.com/hakluke/hakrevdns

    go 1.23.3

    require github.com/jessevdk/go-flags v1.6.1

    require golang.org/x/sys v0.21.0 // indirect
    EOF

    cat > go.sum << EOF
    github.com/jessevdk/go-flags v1.6.1 h1:Cvu5U8UGrLay1rZfv/zP7iLpSHGUZ/Ou68T0iX1bBK4=
    github.com/jessevdk/go-flags v1.6.1/go.mod h1:Mk8T1hIAWpOiJiHa9rJASDK2UGWji0EuPGBnNLMooyc=
    golang.org/x/sys v0.21.0 h1:rF+pYz3DAGSQAxAu1CbC7catZg4ebC4UIeIhKxBZvws=
    golang.org/x/sys v0.21.0/go.mod h1:/VUhepiaJMQUp4+oa/7Zr1D23ma6VTLIYjOOTFZPUcA=
    EOF
  '';

  meta = {
    description = "Small, fast tool for performing reverse DNS lookups en masse";
    homepage = "https://github.com/hakluke/hakrevdns";
    license = lib.licenses.mit;
  };
}
