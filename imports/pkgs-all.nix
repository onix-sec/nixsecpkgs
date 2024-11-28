{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        go-windapsearch = pkgs.callPackage ../pkgs/go-windapsearch { };
        goldencopy = pkgs.callPackage ../pkgs/goldencopy { };
        goshs = pkgs.callPackage ../pkgs/goshs { };
        haiti = pkgs.callPackage ../pkgs/haiti { };
        keyt = pkgs.callPackage ../pkgs/keyt { };
        pof = pkgs.callPackage ../pkgs/pof { };
        pywhisket = pkgs.callPackage ../pkgs/pywhisker { };
        robotstester = pkgs.callPackage ../pkgs/robotstester { };
        shuffledns = pkgs.callPackage ../pkgs/shuffledns { };
        smartbrute = pkgs.callPackage ../pkgs/smartbrute { };
      };
    };
}
