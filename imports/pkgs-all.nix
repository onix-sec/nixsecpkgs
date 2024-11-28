{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        goshs = pkgs.callPackage ../pkgs/goshs { };
        haiti = pkgs.callPackage ../pkgs/haiti { };
        keyt = pkgs.callPackage ../pkgs/keyt { };
      };
    };
}
