# Contributing

This file should explain everything you need to know about the project to get started developing on it.

## Add a package

- Create a directory in `pkgs` with the file `default.nix` in it
- Edit `imports/pkgs-all.nix` to add the new package

Test package:

```bash
nix shell .#your-app
```

Then check the content of the `result/` directory.
