{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        goldencopy = pkgs.callPackage ../pkgs/goldencopy { };
        goshs = pkgs.callPackage ../pkgs/goshs { };
        haiti = pkgs.callPackage ../pkgs/haiti { };
        keyt = pkgs.callPackage ../pkgs/keyt { };
      };
    };
}
