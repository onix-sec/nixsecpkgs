# NixSecPkgs

This repository serves as a collection of cybersecurity tools build with Nix and not present in [nixpkgs](https://github.com/NixOS/nixpkgs).

## Usage

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

- [go-windapsearch](https://github.com/ropnop/go-windapsearch)
- [goldencopy](https://github.com/Dramelac/GoldenCopy)
- [goshs](https://github.com/patrickhener/goshs)
- [haiti](https://github.com/noraj/haiti)
- [keyt](https://github.com/deoktr/keyt)
- [pof](https://github.com/deoktr/pof)
- [pywhisker](https://github.com/ShutdownRepo/pywhisker)
- [robotstester](https://github.com/p0dalirius/robotstester)
- [shuffledns](https://github.com/projectdiscovery/shuffledns)
- [smartbrute](https://github.com/ShutdownRepo/smartbrute)
- [smtp-user-enum](https://github.com/cytopia/smtp-user-enum)
- [sprayhound](https://github.com/Hackndo/sprayhound)
- [sublist3r](https://github.com/aboul3la/Sublist3r)

## TODO

- Add test on packages
- Add CI to build and test packages
- Add cachix

## License

NixSecPkgs is licensed under [MIT](./LICENSE).
