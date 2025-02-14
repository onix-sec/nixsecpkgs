{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        awrbacs = pkgs.callPackage ../pkgs/awrbacs { };
        buster = pkgs.callPackage ../pkgs/buster { };
        byp4xx = pkgs.callPackage ../pkgs/byp4xx { };
        carbon14 = pkgs.callPackage ../pkgs/carbon14 { };
        cmsmap = pkgs.callPackage ../pkgs/cmsmap { };
        crackhound = pkgs.callPackage ../pkgs/crackhound { };
        delta = pkgs.callPackage ../pkgs/delta { };
        dfscoerce = pkgs.callPackage ../pkgs/dfscoerce { };
        digdug = pkgs.callPackage ../pkgs/digdug { };
        entropy = pkgs.callPackage ../pkgs/entropy { };
        finduncommonshares = pkgs.callPackage ../pkgs/finduncommonshares { };
        git-dumper = pkgs.callPackage ../pkgs/git-dumper { };
        gitlab-dump = pkgs.callPackage ../pkgs/gitlab-dump { };
        gmsadumper = pkgs.callPackage ../pkgs/gmsadumper { };
        go-bhtool = pkgs.callPackage ../pkgs/go-bhtool { };
        go-evilarc = pkgs.callPackage ../pkgs/go-evilarc { };
        go-windapsearch = pkgs.callPackage ../pkgs/go-windapsearch { };
        goldencopy = pkgs.callPackage ../pkgs/goldencopy { };
        gosecretsdump = pkgs.callPackage ../pkgs/gosecretsdump { };
        goshs = pkgs.callPackage ../pkgs/goshs { };
        gpp-decrypt = pkgs.callPackage ../pkgs/gpp-decrypt { };
        haiti = pkgs.callPackage ../pkgs/haiti { };
        hakrevdns = pkgs.callPackage ../pkgs/hakrevdns { };
        hashonymize = pkgs.callPackage ../pkgs/hashonymize { };
        homoglyph = pkgs.callPackage ../pkgs/homoglyph { };
        jackit = pkgs.callPackage ../pkgs/jackit { };
        keyt = pkgs.callPackage ../pkgs/keyt { };
        kube-secrets-dump = pkgs.callPackage ../pkgs/kube-secrets-dump { };
        macro_pack = pkgs.callPackage ../pkgs/macro_pack { };
        pof = pkgs.callPackage ../pkgs/pof { };
        pywhisket = pkgs.callPackage ../pkgs/pywhisker { };
        robotstester = pkgs.callPackage ../pkgs/robotstester { };
        shcln = pkgs.callPackage ../pkgs/shcln { };
        shellerator = pkgs.callPackage ../pkgs/shellerator { };
        shuffledns = pkgs.callPackage ../pkgs/shuffledns { };
        smartbrute = pkgs.callPackage ../pkgs/smartbrute { };
        smtp-user-enum = pkgs.callPackage ../pkgs/smtp-user-enum { };
        sprayhound = pkgs.callPackage ../pkgs/sprayhound { };
        sublist3r = pkgs.callPackage ../pkgs/sublist3r { };
        toutatis = pkgs.callPackage ../pkgs/toutatis { };
        uberfile = pkgs.callPackage ../pkgs/uberfile { };
        waybackurls = pkgs.callPackage ../pkgs/waybackurls { };
        webclientservicescanner = pkgs.callPackage ../pkgs/webclientservicescanner { };
        whatportis = pkgs.callPackage ../pkgs/whatportis { };
        xsser = pkgs.callPackage ../pkgs/xsser { };
      };
    };
}
