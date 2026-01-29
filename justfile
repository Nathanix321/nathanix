
rebuild :
    sudo nixos-rebuild switch --flake

write flake:
    nix run .#write-flake

show:
    nix flake show

check:
    nix flake check
