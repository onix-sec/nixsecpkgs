{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        byp4xx = pkgs.callPackage ../pkgs/byp4xx { };
        carbon14 = pkgs.callPackage ../pkgs/carbon14 { };
        cmsmap = pkgs.callPackage ../pkgs/cmsmap { };
        crackhound = pkgs.callPackage ../pkgs/crackhound { };
        dfscoerce = pkgs.callPackage ../pkgs/dfscoerce { };
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
        smtp-user-enum = pkgs.callPackage ../pkgs/smtp-user-enum { };
        sprayhound = pkgs.callPackage ../pkgs/sprayhound { };
        sublist3r = pkgs.callPackage ../pkgs/sublist3r { };
        toutatis = pkgs.callPackage ../pkgs/toutatis { };
        waybackurls = pkgs.callPackage ../pkgs/waybackurls { };
        webclientservicescanner = pkgs.callPackage ../pkgs/webclientservicescanner { };
      };
    };
}
