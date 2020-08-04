{ pkgs ? (import <nixpkgs> {} // import <custompkgs> {}) }:

let
  pyems = pkgs.pyems;
  mh-python = pkgs.python3.withPackages (p: with p; [
    numpy
    scipy
    pathos
    pyems
    matplotlib
    pytest
    twine
    wheel
  ]);
in pkgs.mkShell rec {
  buildInputs = with pkgs; [
    mh-python
    python-openems
    python-csxcad
    (openems.override {withMPI = false; })
    appcsxcad
  ];
}
