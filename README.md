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

- [haiti](https://github.com/noraj/haiti)
- [keyt](https://github.com/deoktr/keyt)

## TODO

- Add test on packages
- Add CI to build and test packages
- Add cachix

## License

NixSecPkgs is licensed under [MIT](./LICENSE).
