{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        keyt = pkgs.callPackage ../pkgs/keyt { };
      };
    };
}
