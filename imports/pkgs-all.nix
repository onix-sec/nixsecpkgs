{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        haiti = pkgs.callPackage ../pkgs/haiti { };
        keyt = pkgs.callPackage ../pkgs/keyt { };
      };
    };
}
