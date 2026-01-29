{
  nixConfig = {
    abort-on-warn = true;
    allow-import-from-derivation = false;
  };

  inputs.self.submodules = true;

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      inputs.import-tree [
        ./hosts
        ./modules
      ]
  );

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/25.11";

    import-tree.url = "github:vic/import-tree";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    #home-manager = {
    #  url = "./inputs/home-manager";
    #  flake = true;
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };
}
