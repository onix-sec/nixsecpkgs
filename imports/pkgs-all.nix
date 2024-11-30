{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        awrbacs = pkgs.callPackage ../pkgs/awrbacs { };
        byp4xx = pkgs.callPackage ../pkgs/byp4xx { };
        carbon14 = pkgs.callPackage ../pkgs/carbon14 { };
        cmsmap = pkgs.callPackage ../pkgs/cmsmap { };
        crackhound = pkgs.callPackage ../pkgs/crackhound { };
        dfscoerce = pkgs.callPackage ../pkgs/dfscoerce { };
        finduncommonshares = pkgs.callPackage ../pkgs/finduncommonshares { };
        git-dumper = pkgs.callPackage ../pkgs/git-dumper { };
        go-bhtool = pkgs.callPackage ../pkgs/go-bhtool { };
        go-evilarc = pkgs.callPackage ../pkgs/go-evilarc { };
        go-windapsearch = pkgs.callPackage ../pkgs/go-windapsearch { };
        goldencopy = pkgs.callPackage ../pkgs/goldencopy { };
        gosecretsdump = pkgs.callPackage ../pkgs/gosecretsdump { };
        goshs = pkgs.callPackage ../pkgs/goshs { };
        haiti = pkgs.callPackage ../pkgs/haiti { };
        hashonymize = pkgs.callPackage ../pkgs/hashonymize { };
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
        whatportis = pkgs.callPackage ../pkgs/whatportis { };
      };
    };
}
