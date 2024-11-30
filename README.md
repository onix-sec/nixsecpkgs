# NixSecPkgs

This repository serves as a collection of cybersecurity tools build with Nix and not present in [nixpkgs](https://github.com/NixOS/nixpkgs).

## Usage

### Nix shell

Open a Nix shell with a single tool in it:

```bash
nix shell --no-write-lock-file github:deoktr/nixsecpkgs#haiti
```

### Overlay

To use packages defined in this repository.

1. Add the repository as an input:

   ```nix
   inputs = {
       nixsecpkgs.url = "github:deoktr/nixsecpkgs";
   };
   ```

2. Include the overlay in `pkgs`:

   ```nix
   pkgs = import inputs.nixpkgs {
     overlays = [
       inputs.nixsecpkgs.overlays.default
     ];
   };
   ```

3. Use packages:

   ```nix
   buildInputs = [ pkgs.pof pkgs.goldencopy ];
   ```

## Packages

- [awrbacs](https://github.com/lobuhi/awrbacs)
- [byp4xx](https://github.com/lobuhi/byp4xx)
- [carbon14](https://github.com/Lazza/Carbon14)
- [cmsmap](https://github.com/dionach/CMSmap)
- [crackhound](https://github.com/trustedsec/CrackHound)
- [dfscoerce](https://github.com/Wh04m1001/DFSCoerce)
- [finduncommonshares](https://github.com/p0dalirius/pyFindUncommonShares)
- [git-dumper](https://github.com/arthaud/git-dumper)
- [go-bhtool](https://github.com/patrickhener/go-bhtool)
- [go-evilarc](https://github.com/patrickhener/go-evilarc)
- [go-windapsearch](https://github.com/ropnop/go-windapsearch)
- [goldencopy](https://github.com/Dramelac/GoldenCopy)
- [gosecretsdump](https://github.com/C-Sto/gosecretsdump)
- [goshs](https://github.com/patrickhener/goshs)
- [haiti](https://github.com/noraj/haiti)
- [hashonymize](https://github.com/ShutdownRepo/hashonymize)
- [keyt](https://github.com/deoktr/keyt)
- [pof](https://github.com/deoktr/pof)
- [pywhisker](https://github.com/ShutdownRepo/pywhisker)
- [robotstester](https://github.com/p0dalirius/robotstester)
- [shellerator](https://github.com/ShutdownRepo/shellerator)
- [shuffledns](https://github.com/projectdiscovery/shuffledns)
- [smartbrute](https://github.com/ShutdownRepo/smartbrute)
- [smtp-user-enum](https://github.com/cytopia/smtp-user-enum)
- [sprayhound](https://github.com/Hackndo/sprayhound)
- [sublist3r](https://github.com/aboul3la/Sublist3r)
- [toutatis](https://github.com/megadose/toutatis)
- [uberfile](https://github.com/ShutdownRepo/uberfile)
- [waybackurls](https://github.com/tomnomnom/waybackurls)
- [webclientservicescanner](https://github.com/Hackndo/WebclientServiceScanner)
- [whatportis](https://github.com/ncrocfer/whatportis)

## TODO

- Add test on packages
- Add CI to build and test packages
- Add cachix

## License

NixSecPkgs is licensed under [MIT](./LICENSE).
