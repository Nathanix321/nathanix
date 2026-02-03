{ inputs, lib, ... }: 
{

  imports = [
    inputs.flake-file.flakeModules.nix-auto-follow
    inputs.treefmt-nix.flakeModule
  ];

  flake-file.inputs = {
    treefmt-nix.url = lib.mkDefault "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = lib.mkDefault "nixpkgs";
  };

  perSystem = { self', ... }:
  {
    packages.fmt = self'.formatter;
    treefmt = {
      projectRoot = inputs.flake-file;
      programs = {
        nixfmt.enable = true;
        deadnix.enable = true;
        nixf-diagnose.enable = true;
        prettier.disable = true;
      };
      settings.on-unmatched = lib.mkDefault "fatal";
      settings.global.exclude = [
        "modules/*"
        "flake.lock"
        "*/flake.lock"
        "*/.gitignore"
      ];
    };
  };
}