{ 
  unstable_pkgs ? import <unstable> {},
  pkgs ? import <nixpkgs> {}
}:

with pkgs;

mkShell {
  nativeBuildInputs = [
    git
    unstable_pkgs.nodejs_22
  ];
}
